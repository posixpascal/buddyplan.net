class ScheduleEvent < ApplicationRecord
  default_scope { order(position: :asc) }

  belongs_to :location, optional: true
  belongs_to :inventory, optional: true

  belongs_to :schedulable, polymorphic: true, optional:true
  has_many :event_participants, :dependent => :destroy

  def relevant_for? actor
    event_participants.where(actor_id: actor.id).count > 0
  end
end
