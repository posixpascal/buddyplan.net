class User < ApplicationRecord
  rolify :role_cname => 'Permission'

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :actors
  has_many :movies, :through => :actors
  has_many :casts
end
