class Item < ApplicationRecord
  belongs_to :inventory
  belongs_to :user, optional: true

  serialize :data
end
