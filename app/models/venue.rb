class Venue < ApplicationRecord
  
#Venue Attributes and Validations
validates :name, presence: true, length:{maximum: 40}
end
