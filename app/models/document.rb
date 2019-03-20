class Document < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_one_attached :file

  before_create :set_file_key

  def set_file_key
    self.file_key = SecureRandom.hex(32).to_s
  end
end
