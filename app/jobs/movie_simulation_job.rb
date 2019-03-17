class MovieSimulationJob < ApplicationJob
  include Sidekiq::Status::Worker
  queue_as :simulations

  def perform(*args)
    # Do something later
  end
end
