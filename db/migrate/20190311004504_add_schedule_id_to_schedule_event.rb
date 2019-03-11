class AddScheduleIdToScheduleEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :schedule_events, :schedule, foreign_key: true
  end
end
