class Movies::InventoriesController < ApplicationController
  before_action :set_movie
  before_action :set_inventory, only: [:destroy, :update, :edit, :show, :destroy]

  def edit
  end

  def index
    @inventories = @movie.inventories
  end

  def create
    @inventory = @movie.inventories.new(inventory_params)

    return redirect_to movie_inventory_path(@movie, @inventory) if @inventory.save

    render json: @inventory.errors
  end

  def show
  end



  def destroy
    @inventory.delete
    redirect_to movie_inventories_path(@movie)
  end

  def update
    @inventory.update(inventory_params)
    redirect_to movie_inventory_path(@movie, @inventory)
  end

  def new
    @inventory = @movie.inventories.new
  end

  private
  def inventory_params
    params.require(:inventory).permit(:name, :inventory_type)
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end
end
