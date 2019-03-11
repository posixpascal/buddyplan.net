class CreateCasts < ActiveRecord::Migration[5.2]
  def change
    create_table :casts do |t|
      t.references :movie
      t.references :user
      t.references :role

      t.timestamps
    end
  end
end
