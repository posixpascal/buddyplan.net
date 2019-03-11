class CreateBreakEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :break_events do |t|
      t.references :schedule, foreign_key: true
      t.references :schedule_event, foreign_key: true
      t.references :location, foreign_key: true
      t.boolean :with_food

      t.timestamps
    end
  end
end
