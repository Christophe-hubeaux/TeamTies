class Game < ApplicationRecord
  has_many :users_games, dependent: :destroy
  has_many :pronostics, dependent: :destroy
  has_many :users, through: :users_games
  has_many :departments, dependent: :destroy
  has_one :chat

validates :name, uniqueness: true

end
