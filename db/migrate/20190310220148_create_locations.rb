class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}

      t.timestamps
    end
  end
end
