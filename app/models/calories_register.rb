class CaloriesRegister < ApplicationRecord
  belongs_to :user
  validates :calories, presence: true

  validates :description, presence: true, length: { maximum: 140 }, numericality: { greater_than_or_equal_to: 0 }
  
  validates :calories_action, presence: true

  validates :date, presence: true
  
end
