class Movies::Schedule::SortController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @order = params[:order]
    @ids = params[:ids]
    # TODO: verify ownership first
    @movie = Movie.find(params[:movie_id].to_i)

    @events = ::Schedule.find(@movie.schedule_id).schedule_events.where(id: @ids)
    @events.each do |event|
      event.position = @order["_#{event.id}".to_sym] || event.position
    end

    @events.map(&:save)
    render json: @events
  end
end
