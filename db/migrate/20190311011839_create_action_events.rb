class CreateActionEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :action_events do |t|
      t.references :schedule, foreign_key: true
      t.references :schedule_event, foreign_key: true
      t.string :action_type
      t.integer :action_id
      t.text :data
      t.text :notes

      t.timestamps
    end
  end
end
