class AddMovieIdToCar < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :movie, foreign_key: true
  end
end
