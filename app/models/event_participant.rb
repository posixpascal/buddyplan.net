class EventParticipant < ApplicationRecord
  belongs_to :schedule
  belongs_to :schedule_event
  belongs_to :actor
  belongs_to :role, optional: true
end
