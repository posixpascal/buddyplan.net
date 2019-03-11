class CreateScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :scenes do |t|
      t.references :movie, foreign_key: true
      t.string :name
      t.string :description
      t.integer :duration
      t.integer :order
      t.references :inventory, foreign_key: true

      t.timestamps
    end
  end
end
