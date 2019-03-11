class AddCarOwnerIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :car_owner_id, :integer
  end
end
