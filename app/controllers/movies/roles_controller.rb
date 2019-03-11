class Movies::RolesController < ApplicationController
  before_action :set_movie
  before_action :set_role, only: [:destroy, :update, :edit, :show, :destroy]

  def edit
  end

  def index
    @roles = @movie.roles
  end

  def create
    @role = @movie.roles.new(role_params)


    return redirect_to movie_roles_path(@movie) if @role.save

    render json: @role.errors
  end

  def show
  end

  def destroy
    @role.delete
    redirect_to movie_roles_path(@movie)
  end

  def update
    @role.update(role_params)
    redirect_to movie_role_path(@movie, @role)
  end

  def new
    @role = @movie.roles.new
  end

  private
  def role_params
    params.require(:role).permit(:name)
  end

  def set_role
    @role = Role.find(params[:id])
  end
end
