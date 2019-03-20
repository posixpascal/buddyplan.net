class CreateWatchdogs < ActiveRecord::Migration[5.2]
  def change
    create_table :watchdogs do |t|
      t.integer :user_id
      t.integer :movie_id
      t.string :watchdog_type
      t.text :data
      t.boolean :active

      t.timestamps
    end
  end
end
