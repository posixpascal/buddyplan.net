class Item < ApplicationRecord
  belongs_to :inventory
  belongs_to :user, optional: true
  has_and_belongs_to_many :scenes
  serialize :data
end
