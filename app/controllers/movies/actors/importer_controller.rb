class Movies::Actors::ImporterController < ApplicationController
  before_action :set_movie
  def index
    @contact_entries = @movie.actor_contact_entries
  end
end
