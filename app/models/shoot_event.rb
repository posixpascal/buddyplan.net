class ShootEvent < ApplicationRecord
  belongs_to :schedule, optional: true
  has_one :schedule_event, as: :schedulable
  belongs_to :location, optional: true
  belongs_to :scene, optional: true, dependent: :destroy
end

