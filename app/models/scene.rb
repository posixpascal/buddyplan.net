class Scene < ApplicationRecord
  belongs_to :inventory, optional: true
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :items
end
