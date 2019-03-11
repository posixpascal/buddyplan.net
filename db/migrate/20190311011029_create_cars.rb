class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :actor, foreign_key: true
      t.string :vendor
      t.string :license_plate
      t.integer :fuel
      t.integer :available_seats

      t.timestamps
    end
  end
end
