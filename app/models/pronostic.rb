class Pronostic < ApplicationRecord
  belongs_to :match
  belongs_to :user
  belongs_to :game
end
