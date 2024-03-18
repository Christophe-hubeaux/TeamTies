class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pseudo, :string
    add_column :users, :department, :string
    add_column :users, :avatar, :string
  end
end
