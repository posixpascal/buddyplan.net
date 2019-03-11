class Scene < ApplicationRecord
  belongs_to :movie
  belongs_to :inventory, optional: true
end
