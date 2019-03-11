class AddScheduledOnToBreakEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :break_events, :estimate, :integer
    add_column :break_events, :scheduled_on, :datetime
  end
end
