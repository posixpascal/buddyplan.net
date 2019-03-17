class MovieSimulationWorkingTimeJob < ApplicationJob
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
    actors = @movie.actors

    actors = actors.map do |actor|

      # only select relevant event for the actor
      relevant_events = events.select {|event|
          event.event_participants.where(actor_id: actor.id).count > 0
      }

      # parse events into group of actions
      actor_actions = relevant_events.map(&method(:parse_event))
      worktime = parse_worktime actor_actions

      {
          actor: "#{actor.firstname} #{actor.lastname}",
          actions: actor_actions,
          worktime: worktime
      }
    end
  end

  def parse_worktime actions
    tasks = []
    total_worktime_time = 0
    max_worktime_between_tasks = 0

    task_group = []
    breaks_group = []
    missed_group = []
    last_action_time = nil
    actions.each do |action|
      missed_group << action unless action[:scheduled_on]
      next unless action[:scheduled_on]

      if action[:type] == "BreakEvent"
        total_worktime_time += max_worktime_between_tasks
        tasks << task_group.clone
        breaks_group << [action, max_worktime_between_tasks]
        max_worktime_between_tasks = 0
        task_group = []
      else
        # unless first action
        if last_action_time
          task_duration_difference = action[:scheduled_on] - last_action_time
          max_worktime_between_tasks += task_duration_difference.minutes
        end

        last_action_time = action[:scheduled_on]
        task_group << action
      end
    end

    {
        total_worktime_time: total_worktime_time,
        max_worktime_between_tasks: max_worktime_between_tasks,
        task_group: task_group,
        breaks_group: breaks_group,
        missed_group: missed_group
    }
  end

  def parse_event ev
    {
        scheduled_on: ev.schedulable.scheduled_on,
        estimate: ev.schedulable&.estimate,
        type: ev.schedulable_type
    }
  end

  def finish(rides, healthy_status = 1)
    # email result
    sr = @simulation.simulation_results.create({
                                                   simulation_job_type: "WorkTime",
                                                   emailed: false,
                                                   healthy_status: healthy_status,
                                                   data: rides
                                               })

    sr.emailed = SimulationResultMailer.working_time(sr.id, rides, @user.id).deliver_now
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
