# Preview all emails at http://localhost:3000/rails/mailers/simulation_result_mailer
class SimulationResultMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/simulation_result_mailer/breaks
  def breaks
    SimulationResultMailer.breaks(SimulationResult.first.id, SimulationResult.first.data, User.first.id)
  end

  def travels
    SimulationResultMailer.travels(SimulationResult.where(simulation_job_type: "Travel").first.id, SimulationResult.first.data, User.first.id)
  end

  def working_time
    SimulationResultMailer.working_time(SimulationResult.where(simulation_job_type: "WorkTime").first.id, SimulationResult.last.data, User.first.id)
  end
end
