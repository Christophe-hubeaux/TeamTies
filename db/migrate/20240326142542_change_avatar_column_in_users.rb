class ChangeAvatarColumnInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :avatar, :string, null: true
  end
end
