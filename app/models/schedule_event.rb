class ScheduleEvent < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :inventory, optional: true

  belongs_to :schedulable, polymorphic: true, optional:true
  has_many :event_participants, :dependent => :destroy
end
