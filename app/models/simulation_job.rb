class SimulationJob < ApplicationRecord
  belongs_to :simulation
  has_many :simulation_results
end
