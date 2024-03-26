class AddGameRefToChats < ActiveRecord::Migration[7.1]
  def change
    add_reference :chats, :game, null: false, foreign_key: true
  end
end
