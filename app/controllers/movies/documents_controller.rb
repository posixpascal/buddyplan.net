class Movies::DocumentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: :create
  before_action :set_movie
  def edit
  end

  def index
    @documents = @movie.documents
  end

  def create
    document = @movie.documents.create!({
      user: current_user
    })
    document.file.attach(params[:file])
    document.save
    render json: document
  end

  def show

  end

  def destroy
    @document = @movie.documents.find(params[:id])
    @document.destroy
    flash[:success] = "Document deleted"
    redirect_to movie_documents_path(@movie)
  end

  def update
  end

  def new
  end
end
