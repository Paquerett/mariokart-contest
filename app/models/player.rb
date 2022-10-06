class Player < ApplicationRecord
  belongs_to :tournament
  belongs_to :chicken, optional: true
end
