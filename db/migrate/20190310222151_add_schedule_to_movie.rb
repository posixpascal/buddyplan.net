class AddScheduleToMovie < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :schedule, foreign_key: true
  end
end
