class MatchSet < ApplicationRecord

  #Associations
  belongs_to :fixture

  #Validations
  validates :set_number, presence: true, numericality: true
  validates :home_score, presence: true, numericality: true
  validates :away_score, presence: true, numericality: true

end
