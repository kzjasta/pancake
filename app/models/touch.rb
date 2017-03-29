class Touch < ApplicationRecord

  #Associations
  has_one :player
  has_one :team
  belongs_to :match_set

  #Validations
  validates :team_id, presence: true
  validates :player_id, presence: true
  validates :position, presence: true, numericality: true
  validates :touch_type, presence: true
  validates :touch_result, presence: true
  
end
