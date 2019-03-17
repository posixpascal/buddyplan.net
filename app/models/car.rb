class Car < ApplicationRecord
  belongs_to :actor, optional: true
  has_many :ride_events, dependent: :destroy

  def readable_name
    "#{vendor} (#{license_plate})"
  end
  def name
    license_plate
  end
end
