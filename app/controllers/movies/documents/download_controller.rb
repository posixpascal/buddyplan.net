class Movies::Documents::DownloadController < ApplicationController
  before_action :set_movie
  before_action :set_document
  def show
    redirect_to rails_blob_path(@document.file, disposition: 'attachment')
  end

  def set_document
    @document = @movie.documents.find(params[:id])
  end
end
