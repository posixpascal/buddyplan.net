class Movies::SimulationController < ApplicationController
  before_action :set_movie
  before_action :authenticate_user!

  def create
    @simulation = @movie.simulations.create(
                                        user_id: current_user.id,
                                        status: :in_progress
    )

    @simulation_jobs = @simulation.simulation_jobs.create([
        {
            simulation_job_type: "Breaks",
            simulation_job_id: MovieSimulationBreaksJob.perform_later(@movie.id, current_user.id, @simulation.id).job_id
        },
        {
            simulation_job_type: "Weather",
            simulation_job_id: MovieSimulationWeatherJob.perform_later(@movie.id, current_user.id, @simulation.id).job_id
        },
        {
            simulation_job_type: "Cars",
            simulation_job_id: MovieSimulationCarsJob.perform_later(@movie.id, current_user.id, @simulation.id).job_id
        },
        {
            simulation_job_type: "Cast",
            simulation_job_id: MovieSimulationCastJob.perform_later(@movie.id, current_user.id, @simulation.id).job_id
        },
        {
            simulation_job_type: "Sleep",
            simulation_job_id: MovieSimulationSleepJob.perform_later(@movie.id, current_user.id, @simulation.id).job_id
        },
        {
            simulation_job_type: "Travel",
            simulation_job_id: MovieSimulationTravelJob.perform_later(@movie.id, current_user.id, @simulation.id).job_id
        },
        {
            simulation_job_type: "WorkingTime",
            simulation_job_id: MovieSimulationWorkingTimeJob.perform_later(@movie.id, current_user.id, @simulation.id).job_id
        }])
  end

  def show
  end
end
