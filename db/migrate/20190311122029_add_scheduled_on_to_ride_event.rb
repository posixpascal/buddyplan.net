class AddScheduledOnToRideEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :ride_events, :scheduled_on, :datetime
    add_column :ride_events, :scheduled_after_id, :integer
  end
end
