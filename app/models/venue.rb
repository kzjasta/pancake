class Venue < ApplicationRecord
  
#Venue Attributes and Validation
validates :name, presence: true, length:{maximum: 40}
end
