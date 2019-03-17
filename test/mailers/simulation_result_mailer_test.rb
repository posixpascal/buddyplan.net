require 'test_helper'

class SimulationResultMailerTest < ActionMailer::TestCase
  test "breaks" do
    mail = SimulationResultMailer.breaks
    assert_equal "Breaks", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
