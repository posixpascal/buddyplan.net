class ActionEvent < ApplicationRecord
  belongs_to :schedule, optional: true
  has_one :schedule_event, as: :schedulable
end
