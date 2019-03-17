class AddIsSleepableToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :for_sleeping, :boolean
  end
end
