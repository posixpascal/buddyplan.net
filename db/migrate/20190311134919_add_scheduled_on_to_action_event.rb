class AddScheduledOnToActionEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :action_events, :estimate, :integer
    add_column :action_events, :scheduled_on, :datetime
  end
end
