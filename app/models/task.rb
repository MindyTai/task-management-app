class Task < ApplicationRecord
  belongs_to :user

  validates :title, :description, :end_time, :status, :priority, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => true

  enum status: {
    ongoing: 0,
    finished: 1,
    pending: 2
  }

  enum priority: {
    low: 0,
    medium: 1,
    high: 2
  }

end
