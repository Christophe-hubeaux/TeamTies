class AddWinnerIdToMatch < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :winner_id, :integer
    add_foreign_key :matches, :teams, column: :winner_id
  end
end
