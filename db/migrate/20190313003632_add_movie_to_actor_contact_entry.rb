class AddMovieToActorContactEntry < ActiveRecord::Migration[5.2]
  def change
    add_reference :actor_contact_entries, :movie, foreign_key: true
  end
end
