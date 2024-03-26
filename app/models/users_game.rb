class UsersGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :department

  validates :game, uniqueness: { scope: :user }
end
