class ChatChannel < ApplicationCable::Channel
    def subscribed
      chat = Chat.find(params[:id])
      stream_for chat
    end# stream_from "some_channel"

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
