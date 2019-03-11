class AddInventoryTypeToInventory < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :inventory_type, :integer
  end
end
