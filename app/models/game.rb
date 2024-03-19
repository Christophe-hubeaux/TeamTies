class Game < ApplicationRecord
  has_many :users_games
  has_many :pronostics
end
