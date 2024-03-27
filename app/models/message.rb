# app/models/message.rb
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  validates :content, presence: true
  validates :user_id, presence: true
  validates :chat_id, presence: true

  def self.most_recent
    order(created_at: :desc)
  end

  def to_partial_path
    'messages/message'
  end

  def sender?(a_user)
    user.id == a_user.id
  end
end
