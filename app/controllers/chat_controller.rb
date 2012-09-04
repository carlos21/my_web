class ChatController < ApplicationController
  layout 'real_chat'

  def new
    chat = Chat.new
    if chat.save
      chat.channel = 'message_channel_' + chat.id.to_s
      chat.save
      
      redirect_to :action => 'chat', :id => chat.id
    end
  end

  def chat
    if !params[:id].nil?
      @chat = Chat.find(params[:id])
      @user = User.get_or_set_user(session)
      @messages = Message.where(:chat_id => @chat.id)
    end
  end

end
