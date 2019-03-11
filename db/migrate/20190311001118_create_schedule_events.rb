class CreateScheduleEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_events do |t|
      t.string :schedulable_type
      t.integer :schedulable_id
      t.datetime :scheduled_on
      t.integer :scheduled_after_id
      t.integer :duration
      t.integer :status
      t.references :location, foreign_key: true
      t.references :inventory, foreign_key: true

      t.timestamps
    end
  end
end
