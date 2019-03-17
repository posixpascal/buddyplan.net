class Actor < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :movie

  def color
  end
end
