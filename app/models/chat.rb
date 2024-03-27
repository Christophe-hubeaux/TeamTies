# app/models/chat.rb
class Chat < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages
  belongs_to :game
end
