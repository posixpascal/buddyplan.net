class Movies::Schedule::ListController < ApplicationController
  before_action :set_silent_movie
  before_action :authenticate_user!

  def index
    @actors = @movie_.actors
  end

  def set_silent_movie
    @movie_ = Movie.find(params[:movie_id])
  end
end
