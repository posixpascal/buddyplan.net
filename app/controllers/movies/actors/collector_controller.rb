class Movies::Actors::CollectorController < ApplicationController
  before_action :set_movie
  layout "public"
  def show
    @contact = ActorContactEntry.new(movie_id: @movie.id)
  end

  def create
    @contact = ActorContactEntry.new(contact_params)
    @contact.movie_id = @movie.id
    return render :show unless @contact.save
  end

  private
  def contact_params
    params.require(:actor_contact_entry).permit(:firstname, :lastname, :phonenumber, :email, :allergenes, :street, :location, :postalcode, :dob)
  end
end
