class Pronostic < ApplicationRecord
  belongs_to :match
  belongs_to :user
  belongs_to :game
  validates :user, uniqueness: { scope: [:game, :match] }
end
