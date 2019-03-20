class Movies::Actors::ImporterController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie
  before_action :set_contact_entry, only: [:new, :show, :create]
  before_action :set_fields

  def index
    @contact_entries = @movie.actor_contact_entries
  end

  def create
    @actor = @movie.actors.find(params[:actor_id])
    @fields.each do |field|
      if params["import_#{field.to_s}"]
        @actor.send("#{field.to_s}=", @contact_entry.send(field))
      end
    end
    @actor.save
    flash[:success] = "Imported fields successfully"
    return redirect_to importer_movie_actors_path(@movie)
  end

  def show

  end

  def new
    @actor = @movie.actors.find(params[:actor_id]) if params[:actor_id]
  end

  def set_fields
    @fields = [:firstname, :lastname, :email, :phonenumber, :street, :location, :allergenes]
  end

  def set_contact_entry
    @contact_entry = @movie.actor_contact_entries.find(params[:contact_entry_id])
  end
end
