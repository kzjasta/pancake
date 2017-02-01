class Team < ApplicationRecord

  #Associations
  belongs_to :user
  has_many :players, dependent: :destroy

  #Team Attributes and Validation
  validates :team_id, presence: true
  validates :name, presence: true, length:{maximum: 40}
  validates :description, presence: true, length:{maximum: 140}
end
