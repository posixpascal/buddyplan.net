class Movies::ScenesController < ApplicationController
  before_action :set_movie
  before_action :set_scene, only: [:destroy, :update, :edit, :show, :destroy]

  def edit
  end

  def index
    @scenes = @movie.scenes
  end

  def create
    @scene = @movie.scenes.new(scene_params)


    return redirect_to movie_scene_path(@movie, @scene) if @scene.save

    render json: @scene.errors
  end

  def show
  end

  def destroy
    @scene.delete
    redirect_to movie_scenes_path(@movie)
  end

  def update
    @scene.update(scene_params)
    redirect_to movie_scene_path(@movie, @scene)
  end

  def new
    @scene = @movie.scenes.new
  end

  private
  def scene_params
    params.require(:scene).permit(:name)
  end

  def set_scene
    @scene = Scene.find(params[:id])
  end
end
