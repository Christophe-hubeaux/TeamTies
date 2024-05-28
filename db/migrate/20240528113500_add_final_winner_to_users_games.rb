class AddFinalWinnerToUsersGames < ActiveRecord::Migration[7.1]
  def change
    add_reference :users_games, :final_winner, foreign_key: { to_table: :teams }
  end
end
