class AddDataToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :data, :text
  end
end
