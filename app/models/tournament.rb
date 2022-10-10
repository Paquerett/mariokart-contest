class Tournament < ApplicationRecord
  belongs_to :user
  has_many :players
  has_many :chickens
end
