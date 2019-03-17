class SimulationResult < ApplicationRecord
  belongs_to :simulation
  has_many_attached :reports
  serialize :data
end
