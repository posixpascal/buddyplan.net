class Movie < ApplicationRecord
  has_many :scenes
  has_many :actors
  has_many :users, through: :actors
  has_many :locations
  has_many :roles
  has_many :inventories
  has_many :documents
  has_many :cars

  has_one :schedule
end
