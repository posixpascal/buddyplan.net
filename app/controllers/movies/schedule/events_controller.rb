class Movies::Schedule::EventsController < ApplicationController
  before_action :set_movie
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
