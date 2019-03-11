class AddEstimateToRideEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :ride_events, :estimate, :integer
  end
end
