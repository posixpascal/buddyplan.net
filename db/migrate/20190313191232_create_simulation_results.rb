class CreateSimulationResults < ActiveRecord::Migration[5.2]
  def change
    create_table :simulation_results do |t|
      t.references :simulation, foreign_key: true
      t.string :simulation_job_type
      t.integer :healthy_status
      t.boolean :emailed
      t.datetime :emailed_at

      t.timestamps
    end
  end
end
