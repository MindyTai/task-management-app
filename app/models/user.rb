class User < ApplicationRecord
  has_many :tasks
  validates :user_name, uniqueness: true
end
