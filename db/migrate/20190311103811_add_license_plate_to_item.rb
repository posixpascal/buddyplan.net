class AddLicensePlateToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :license_plate, :string
  end
end
