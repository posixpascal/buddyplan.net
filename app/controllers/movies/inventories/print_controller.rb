class Movies::Inventories::PrintController < ApplicationController
  before_action :set_movie
  before_action :set_inventory
  before_action :authenticate_user!
  layout "pdf"
  def create

  end



  def set_inventory
    @inventory = Movie.find(params[:movie_id]).inventories.find(params[:id])
  end
end
