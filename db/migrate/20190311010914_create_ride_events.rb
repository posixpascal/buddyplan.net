class CreateRideEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_events do |t|
      t.references :location, foreign_key: true
      t.integer :duration
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
