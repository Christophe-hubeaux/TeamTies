class AddOwnerToUsersGames < ActiveRecord::Migration[7.1]
  def change
    add_column :users_games, :owner, :boolean, default: false
  end
end
