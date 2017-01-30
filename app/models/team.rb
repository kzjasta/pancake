class Team < ApplicationRecord

  #Associations
  belongs_to :user

  #User Attributes and Validation
  validates :user_id, presence: true
  validates :name, presence: true, length:{maximum: 40}
  validates :description, presence: true, length:{maximum: 140}
end
