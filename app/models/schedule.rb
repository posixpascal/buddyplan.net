class Schedule < ApplicationRecord
  belongs_to :movie
  has_many :schedule_events


  def events_at(date)
    schedule_events.where("scheduled_on >= ?", date.beginning_of_day).where("scheduled_on <= ?", date.end_of_day)
  end

  def schedule_days
    return [] unless scheduled_from and scheduled_to

    (scheduled_from.to_date).upto(scheduled_to.to_date)
  end
end
