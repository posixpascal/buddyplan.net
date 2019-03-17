class Movie < ApplicationRecord
  resourcify :permissions, role_cname: "Permission"

  has_many :scenes, dependent: :destroy
  has_many :actors, dependent: :destroy
  has_many :users, through: :actors, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :inventories, dependent: :destroy
  has_many :items, through: :inventories
  has_many :documents, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :simulations, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :movie_money_transfers
  belongs_to :schedule

  def superadmin
    User.find(user_id)
  end

  def schedule_for(actor)
    #ActorSchedulePdfJob.perform(self.id, actor.id)
  end
end
