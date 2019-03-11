class Location < ApplicationRecord
  belongs_to :movie
  belongs_to :user, optional: true
end
