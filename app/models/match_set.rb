class MatchSet < ApplicationRecord

  #Associations
  belongs_to :fixture
  has_many :touches

  #Validations
  validates :set_number, presence: true, :numericality => {:greater_than => 0}, :uniqueness => {:scope => :fixture_id, :message => 'already exists'}
  validates :home_score, presence: true, :numericality => {:greater_than => 0}
  validates :away_score, presence: true, :numericality => {:greater_than => 0} 
  validate :set_number_is_less_than_six, :score_must_be_at_least_two_points_behind_if_over_twenty_five, :score_must_be_at_least_twenty_five
  





  #Checks if set number is less than 6
  def set_number_is_less_than_six
    if set_number.present? && set_number > 5
      errors.add(:set_number, 'cannot be greater than 5')
    end
  end


  #Checks if one score is over 25 then the other must be behind by 2 points
  def score_must_be_at_least_two_points_behind_if_over_twenty_five
    if home_score.present? && home_score > 25 && away_score != home_score-2
      errors.add(:home_score, 'cannot have more than a 2 point lead when over 25')
    elsif away_score.present? && away_score > 25 && home_score != away_score-2
      errors.add(:away_score, 'cannot have more than a 2 point lead when over 25')
    end
  end

  #Checks if higher score is 25
  def score_must_be_at_least_twenty_five
    if home_score.present? && away_score.present? && home_score < 25 && away_score < 25
      errors.add(:At, 'least one score must equal 25.')
    end
  end

end
