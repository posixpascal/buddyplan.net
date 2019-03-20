class Movies::ActorsController < ApplicationController
  before_action :set_movie
  before_action :set_actor, only: [:destroy, :update, :edit, :show, :destroy]
  before_action :authenticate_user!
  def edit
  end

  def index
    @actors = @movie.actors
    @collect_info_url = "https://bupl.net/movies/#{@movie.id}/actors/collect"
    @qrcode = RQRCode::QRCode.new(@collect_info_url)
  end

  def create
    @actor = @movie.actors.new(actor_params)


    return redirect_to movie_actor_path(@movie, @actor) if @actor.save

    render json: @actor.errors
  end

  def show
  end

  def destroy
    @actor.delete
    redirect_to movie_actors_path(@movie)
  end

  def update
    @actor.update(actor_params)
    redirect_to movie_actor_path(@movie, @actor)
  end

  def new
    @actor = @movie.actors.new
  end

  private
  def actor_params
    params.require(:actor).permit(:firstname, :lastname, :email, :street, :allergenes, :postalcode, :city)
  end

  def set_actor
    @actor = Actor.find(params[:id])
  end
end
