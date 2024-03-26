class Department < ApplicationRecord
  belongs_to :game
  has_many :users_game
end
