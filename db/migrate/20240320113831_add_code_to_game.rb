class AddCodeToGame < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :code, :string
  end
end
