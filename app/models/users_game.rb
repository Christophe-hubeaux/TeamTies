class UsersGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :department
  belongs_to :final_winner, class_name: 'Team', optional: true

  validates :game, uniqueness: { scope: :user }
end
