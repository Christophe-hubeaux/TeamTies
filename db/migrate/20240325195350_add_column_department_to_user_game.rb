class AddColumnDepartmentToUserGame < ActiveRecord::Migration[7.1]
  def change
    add_reference :users_games, :department, foreign_key: true
  end
end
