class Movies::Schedule::EventsController < ApplicationController
  before_action :set_movie
  before_action :authenticate_user!
  def create
    # TODO: sanitize
    @event = params[:event].constantize.new
    day = Date.parse(params[:day])
    @schedule_event = @movie.schedule.schedule_events.create(
                                       scheduled_on: day,
                                       schedulable: @event
    )
  end
end
