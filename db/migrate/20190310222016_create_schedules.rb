class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :movie, foreign_key: true
      t.string :title
      t.datetime :scheduled_from
      t.datetime :scheduled_to

      t.timestamps
    end
  end
end
