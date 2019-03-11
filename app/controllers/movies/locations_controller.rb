class Movies::LocationsController < ApplicationController
  before_action :set_movie
  before_action :set_location, only: [:destroy, :update, :edit, :show, :destroy]

  def edit
  end

  def index
    @locations = @movie.locations
  end

  def create
    @location = @movie.locations.new(location_params)


    return redirect_to movie_location_path(@movie, @location) if @location.save

    render json: @location.errors
  end

  def show
  end

  def destroy
    @location.delete
    redirect_to movie_locations_path(@movie)
  end

  def update
    @location.update(location_params)
    redirect_to movie_location_path(@movie, @location)
  end

  def new
    @location = @movie.locations.new
  end

  private
  def location_params
    params.require(:location).permit(:name)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
