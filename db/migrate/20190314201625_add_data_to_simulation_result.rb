class AddDataToSimulationResult < ActiveRecord::Migration[5.2]
  def change
    add_column :simulation_results, :data, :text
  end
end
