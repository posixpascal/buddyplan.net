class Simulation < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :simulation_jobs
  has_many :simulation_results
end
