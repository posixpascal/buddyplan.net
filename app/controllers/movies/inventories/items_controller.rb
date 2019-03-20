class Movies::Inventories::ItemsController < ApplicationController
  before_action :set_movie
  before_action :set_inventory
  before_action :authenticate_user!
  before_action :set_item, only: [:destroy, :edit, :update]
  def create
    @item = @inventory.items.create(item_params)
    if @item.errors
      return redirect_to new_movie_inventory_item_path(@movie, @inventory)
    end
    redirect_to movie_inventory_path(@movie, @inventory)
  end

  def new
    @item = @inventory.items.new
  end

  def update
    @item.update(item_params)
    flash[:success] = "Item saved"
    return redirect_to edit_movie_inventory_item_path(@movie, @inventory)
  end

  def edit

  end

  def destroy
    @item.destroy
    redirect_to movie_inventory_path(@movie, @inventory)
  end

  def set_inventory
    @inventory = @movie.inventories.find(params[:inventory_id])
  end

  def item_params
    params.require(:item).permit(:license_plate, :car_owner_id, :name, scene_ids: [])
  end

  def set_item
    @item = @inventory.items.find(params[:id])
  end
end
