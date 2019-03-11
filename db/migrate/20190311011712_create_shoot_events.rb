class CreateShootEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :shoot_events do |t|
      t.references :schedule, foreign_key: true
      t.references :schedule_event, foreign_key: true
      t.references :scene, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
