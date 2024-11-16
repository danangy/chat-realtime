class ChatsController < ApplicationController
    def index
      @chats = Chat.all
      @chat = Chat.new
    end
  end