class Game < ApplicationRecord
  has_many :users_games
  has_many :pronostics
  has_many :users, through: :users_games
  has_one :chat

  after_create :create_chat_associated_with_game

  private

  def create_chat_associated_with_game
    Chat.create(name: "test1", game: self)
  end
end
