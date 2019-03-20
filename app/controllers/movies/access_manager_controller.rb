class Movies::AccessManagerController < ApplicationController
  before_action :set_movie
  before_action :authenticate_user!
  def show
  end
end
