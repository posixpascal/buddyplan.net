class MovieSimulationBreaksJob < ApplicationJob
  include Sidekiq::Status::Worker
  queue_as :simulations


  def perform(movie_id, user_id, simulation_id)
    @movie = Movie.find(movie_id)
    @user = User.find(user_id)
    @simulation = @movie.simulations.find(simulation_id)

    @result = @movie.schedule.schedule_days.map do |scheduled_day|
      @events = @movie.schedule.events_at(scheduled_day)
      simulate @events
    end

    finish @result
  end

  def simulate events
    break_events = events.where(schedulable_type: "BreakEvent")
    # Gather a list of all people involved in each break
    breaks = break_events.map do |break_event|
      {
          "food": break_event.schedulable.with_food?,
          "participants": participants_for(break_event),
          "location": break_event.schedulable.location&.name,
          "scheduled_for": break_event.schedulable.scheduled_on,
          "estimate": break_event.schedulable.estimate
      }
    end
    breaks
  end

  def finish(breaks, healthy_status = 1)
    # email result
    sr = @simulation.simulation_results.create({
                                                   simulation_job_type: "Breaks",
                                                   emailed: false,
                                                   healthy_status: healthy_status,
                                                   data: breaks
                                               })

    sr.emailed = SimulationResultMailer.breaks(sr.id, breaks, @user.id).deliver_now
    if sr.emailed
      sr.emailed_at = Time.zone.now
    end
    sr.save
  end

  def participants_for event
    event.event_participants.map do |ep|
      {
          firstname: ep.actor.firstname,
          lastname: ep.actor.lastname,
          role: ep.role&.name
      }
    end
  end
end
