class MatchSet < ApplicationRecord

  #Associations
  belongs_to :fixture_id

  #Validations
  validates :set_number, presence: true, numericality: true

end
