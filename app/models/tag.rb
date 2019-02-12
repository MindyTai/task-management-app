class Tag < ApplicationRecord
  has_many :taggings
  has_many :tasks, through: :taggings
 
  validates :name, uniqueness: true
  enum name:{
    Homework: 0,
    Housework: 1
  }
end
