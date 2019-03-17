class RideEvent < ApplicationRecord
  belongs_to :schedule, optional: true
  has_one :schedule_event, as: :schedulable
  belongs_to :location, optional: true
  belongs_to :car, optional: true, dependent: :destroy
end
