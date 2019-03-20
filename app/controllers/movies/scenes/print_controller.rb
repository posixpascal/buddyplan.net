class Movies::Scenes::PrintController < ApplicationController
  before_action :set_movie
  before_action :set_scene

  layout "pdf"
  def create

  end



  def set_scene
    @scene = Movie.find(params[:movie_id]).scenes.find(params[:id])
  end
end
