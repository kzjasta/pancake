class Player < ApplicationRecord
  
  #Associations
  belongs_to :team
  mount_uploader :image, ImageUploader

  #Player Attributes and Validation
  validates :first_name, presence: true, length:{maximum: 25}
  validates :last_name, presence: true, length:{maximum: 25}
  validates :date_of_birth, presence: true
  validates :position, presence: true
  validates :height, numericality: true
  validates :weight, numericality: true
  validates :spike_reach, numericality: true
  validates :block_reach, numericality: true
  validates :nationality, presence: true
  
end
