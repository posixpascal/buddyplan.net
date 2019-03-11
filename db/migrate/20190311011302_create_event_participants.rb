class CreateEventParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :event_participants do |t|
      t.references :schedule, foreign_key: true
      t.references :schedule_event, foreign_key: true
      t.references :actor, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
