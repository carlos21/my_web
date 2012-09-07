class ChatController < ApplicationController

  def post_message
    chat = Chat.find(1)
    user = User.get_or_set_user(session[:userid])

    message = Message.new
    message.description = params[:message]
    message.chat_id = chat.id
    message.user_id = user.id
    message.created_at = Time.now
    message.updated_at = Time.now

    data = message.attributes
    data[:user] = user.attributes

    if message.save
      Pusher[chat.channel].trigger('receive_message', data)
      render :text => "sent"
    else
      render :text => "error"
    end
    
  end

  def typing_status
    chat = Chat.find(1)
    user = User.get_or_set_user(session[:userid])

    data = { :user => user.attributes, :status => params[:status]}
    Pusher[chat.channel].trigger('typing_status', data)
    render :text => "sent"
  end

  def change_nickname
    user = User.get_or_set_user(session[:userid])
    user.nickname = params[:nickname]
    user.save
    render :text => "sent"
  end

end
