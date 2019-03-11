class AddLocationToShootEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :shoot_events, :location, foreign_key: true
  end
end
