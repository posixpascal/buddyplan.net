class SimulationResultMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.simulation_result_mailer.breaks.subject
  #
  def breaks(simulation_result_id, data, user_id)
    @user = User.find(user_id)
    @simulation_result = SimulationResult.find(simulation_result_id)


    mail to: "pascal@raszyk.de"
  end

  def travels(simulation_result_id, data, user_id)
    @user = User.find(user_id)
    @simulation_result = SimulationResult.find(simulation_result_id)


    mail to: "pascal@raszyk.de"
  end

  def working_time(simulation_result_id, data, user_id)
    @user = User.find(user_id)

    @simulation_result = SimulationResult.find(simulation_result_id)


    mail to: "pascal@raszyk.de"
  end
end
