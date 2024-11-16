class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:chat_id]}"
  end
end