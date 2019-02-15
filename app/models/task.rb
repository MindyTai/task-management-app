class Task < ApplicationRecord
  belongs_to :user
  has_many :taggings ,dependent: :destroy
  has_many :tags, through: :taggings ,dependent: :destroy

  validates :title, :description, :end_time, :status, :priority, :presence => true
  validates :title, :length => { :minimum => 2 }

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


  def self.tagged_with(name)
    Tag.find_by(name: name).tasks
  end

end
