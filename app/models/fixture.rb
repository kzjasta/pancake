class Fixture < ApplicationRecord

  #Associations
  belongs_to :venue, :class_name => "Venue", foreign_key: "venue_id"
  belongs_to :home_team, :class_name => "Team",  foreign_key: "home_team_id"
  belongs_to :away_team, :class_name => "Team", foreign_key: "away_team_id"
  has_many :match_sets, dependent: :destroy


  #Fixture Attributes and Validations
  validates :home_team_id, presence: true
  validates :away_team_id, presence: true
  validates :date_time, presence: true
  validates :home_score, presence: true
  validates :away_score, presence: true
  validates :venue_id, presence: true

end
