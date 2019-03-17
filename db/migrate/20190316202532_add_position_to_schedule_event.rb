class AddPositionToScheduleEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :schedule_events, :position, :integer
  end
end
