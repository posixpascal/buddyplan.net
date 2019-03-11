class Movies::ScheduleController < ApplicationController
  before_action :set_movie
  before_action :set_schedule

  def edit
  end

  def show
  end

  def update
    @schedule.update(schedule_params)
    redirect_to movie_schedule_path(@movie, @schedule)
  end

  def new
  end

  private
  def set_schedule
    @schedule = @movie.schedule
  end

  def schedule_params
    params.require(:schedule).permit(:scheduled_from, :scheduled_to)
  end
end
