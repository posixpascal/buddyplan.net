class Movies::CarsController < ApplicationController
  before_action :set_movie
  before_action :set_car, only: [:destroy, :update, :edit, :show, :destroy]
  before_action :authenticate_user!
  def edit
  end

  def index
    @cars = @movie.cars
  end

  def create
    @car = @movie.cars.new(car_params)


    return redirect_to movie_car_path(@movie, @car) if @car.save

    render json: @car.errors
  end

  def show
  end

  def destroy
    @car.delete
    redirect_to movie_cars_path(@movie)
  end

  def update
    @car.update(car_params)
    redirect_to movie_car_path(@movie, @car)
  end

  def new
    @car = @movie.cars.new
  end

  private
  def car_params
    params.require(:car).permit(:name, :vendor, :license_plate, :available_seats, :fuel, :movie_id, :actor_id)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
