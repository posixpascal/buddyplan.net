class CreateSimulations < ActiveRecord::Migration[5.2]
  def change
    create_table :simulations do |t|
      t.references :movie, foreign_key: true
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
