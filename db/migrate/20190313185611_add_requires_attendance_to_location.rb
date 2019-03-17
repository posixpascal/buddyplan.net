class AddRequiresAttendanceToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :required_attendance, :boolean
  end
end
