class Game < ApplicationRecord
  has_many :users_games
  has_many :pronostics
  has_many :users, through: :users_games

  validates :name, presence: true
  validates :code, presence: true, length: { minimum: 5, too_short: "Minimum 5 caractères" }

end
