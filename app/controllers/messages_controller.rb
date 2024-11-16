class MessagesController < ApplicationController
    def create
      @chat = Chat.find(params[:chat_id])
      @message = @chat.messages.new(message_params)
      
      if @message.save
        # Broadcast the message to the chat channel for real-time updates
        ActionCable.server.broadcast "chat_#{@chat.id}_channel", @message
  
        # Redirect to the chats index page (or the chat's show page)
        redirect_to chats_path, notice: 'Message sent successfully!'
      else
        # Handle the case where the message fails to save
        render :new
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:body)
    end
  end