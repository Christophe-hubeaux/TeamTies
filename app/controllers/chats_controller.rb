class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
    @messages = @chat.messages.order(created_at: :asc)
  end
end
