class ScheduleEvent < ApplicationRecord
  default_scope { order(position: :asc) }

  belongs_to :location, optional: true
  belongs_to :inventory, optional: true

  belongs_to :schedulable, polymorphic: true, optional:true
  has_many :event_participants, :dependent => :destroy

  def relevant_for? actor
    event_participants.where(actor_id: actor.id).count > 0
  end

  def current_car_location
    schedule = Schedule.find(schedule_id)
    # find previous ride events with said car
    last_ride_event = schedule.schedule_events.joins("INNER JOIN ride_events ON ride_events.id = schedulable_id",).where(schedulable_type: "RideEvent").where("position < ?", position).where("ride_events.car_id = ?", schedulable&.car_id).order(position: :asc).limit(1).first
    if last_ride_event
      return last_ride_event.schedulable.location
    end
    return nil
  end
end
