class MovieSimulationTravelJob < ApplicationJob
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
    ride_events = events.where(schedulable_type: "RideEvent")
    @last_locations = @last_locations || {}
    rides = ride_events.map do |ride_event|
      next unless ride_event.schedulable.car
      car_name = ride_event.schedulable.car&.license_plate.to_sym
      data = {
        car: {
            license_plate: ride_event.schedulable.car.license_plate,
            owner: "#{ride_event.schedulable.car&.actor&.firstname} #{ride_event.schedulable.car&.actor&.lastname}"
        },
        from: @last_locations[car_name] || "Unknown Location",
        to: ride_event.schedulable&.location&.name,
        participants: participants_for(ride_event),#
        "scheduled_for": ride_event.schedulable&.scheduled_on,
      }
      @last_locations[car_name] = ride_event.schedulable&.location&.name
      data
    end
  end

  def finish(rides, healthy_status = 1)
    # email result
    sr = @simulation.simulation_results.create({
                                                   simulation_job_type: "Travel",
                                                   emailed: false,
                                                   healthy_status: healthy_status,
                                                   data: rides
                                               })

    sr.emailed = SimulationResultMailer.travels(sr.id, rides, @user.id).deliver_now
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
