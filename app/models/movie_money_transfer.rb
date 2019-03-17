class MovieMoneyTransfer < ApplicationRecord
  belongs_to :movie
  belongs_to :actor, optional: true
  belongs_to :item, optional: true
  belongs_to :user, optional: true
end
