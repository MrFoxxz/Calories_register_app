class CaloriesRegister < ApplicationRecord
  belongs_to :user
  
  validates :calories, presence: true, numericality: {greater_than: 0}

  validates :description, presence: true, length: { maximum: 140 }
  
  validates :calories_action, presence: true

  validates :date, presence: true
  
  paginates_per 5

  
end
