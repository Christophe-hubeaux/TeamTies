class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.find(params[:game_id])
    @message = Message.new
  end

  def create
    @chat = Chat.find(params[:chat_id])
    @game = @chat.game
    @message = @chat.messages.new(message_params)
    @message.user = current_user
    if @message.save
      ChatChannel.broadcast_to(
        @chat,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
