class Movies::ScheduleEvents::ShootEventsController < ApplicationController
  before_action :set_movie
  before_action :set_schedule_event
  before_action :set_shoot_event, only: [:edit, :update, :destroy]
  def create
    @schedule_event.schedulable = ShootEvent.create(shoot_event_params)
    assign_participants
    redirect_to movie_schedule_path(@movie)
  end

  def edit
  end

  def assign_participants
    actors = @movie.actors
    return unless actors.count
    @schedule_event.event_participants.destroy_all
    actors.each do |actor|
      if params["actor_#{actor.id}"]
        @schedule_event.event_participants.create({
            schedule_id: @movie.schedule.id,
            actor_id: actor.id,
            role_id: params["actor_role_#{actor.id}"]

                                                  })
      end
    end
  end

  def update
    @event.update(shoot_event_params)
    assign_participants
    redirect_to movie_schedule_path(@movie)
  end

  def destroy
    @schedule_event.destroy
    flash[:success] = "Shoot deleted"
    redirect_to movie_schedule_path(@movie)
  end

  private
  def set_schedule_event
    @schedule_event = ScheduleEvent.find(params[:schedule_event_id])
  end

  def shoot_event_params
    params.require(:shoot_event).permit(:location_id, :scene_id, :estimate, :scheduled_on)
  end

  def set_shoot_event
    @event = ShootEvent.find(params[:id])
  end

end
