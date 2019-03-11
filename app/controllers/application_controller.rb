class ApplicationController < ActionController::Base

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
