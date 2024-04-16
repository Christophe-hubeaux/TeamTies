class Department < ApplicationRecord
  belongs_to :game
  has_many :users_game

  validates :game, uniqueness: { scope: :name }
end
