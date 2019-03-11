class AddScheduledOnToShootEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :shoot_events, :estimate, :integer
    add_column :shoot_events, :scheduled_on, :datetime
  end
end
