class User < ApplicationRecord
  has_secure_password
  
  has_many :tasks
  validates :user_name, uniqueness: true
  validates :password, confirmation: true
end
