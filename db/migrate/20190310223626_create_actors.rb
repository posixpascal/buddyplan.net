class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
