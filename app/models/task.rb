class Task < ApplicationRecord
  belongs_to :user

  validates :title, :description, :end_time, :status, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => true
end
