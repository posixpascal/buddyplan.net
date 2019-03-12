class Movie < ApplicationRecord
  resourcify :permissions, role_cname: "Permission"

  has_many :scenes
  has_many :actors
  has_many :users, through: :actors
  has_many :locations
  has_many :inventories
  has_many :documents
  has_many :cars
  has_one :schedule

  def superadmin
    User.find(user_id)
  end

  def schedule_for(actor)
    ActorSchedulePdfJob.perform(self.id, actor.id)
  end
end
