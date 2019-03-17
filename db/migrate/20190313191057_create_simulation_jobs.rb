class CreateSimulationJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :simulation_jobs do |t|
      t.references :simulation, foreign_key: true
      t.string :simulation_job_type
      t.string :simulation_job_id
      t.integer :status

      t.timestamps
    end
  end
end
