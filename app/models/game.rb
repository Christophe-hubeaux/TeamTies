class Game < ApplicationRecord
  has_many :users_games
  has_many :pronostics
  has_many :users, through: :users_games
end
