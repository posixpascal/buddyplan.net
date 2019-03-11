class Car < ApplicationRecord
  belongs_to :actor, optional: true
  belongs_to :movie


  def readable_name
    "#{vendor} (#{license_plate})"
  end
  def name
    license_plate
  end
end
