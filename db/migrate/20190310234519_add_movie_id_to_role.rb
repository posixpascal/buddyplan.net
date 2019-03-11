class AddMovieIdToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :movie_id, :integer
  end
end
