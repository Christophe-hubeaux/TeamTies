class UsersGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :department
end
