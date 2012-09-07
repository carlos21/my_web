class ApiController < ApplicationController

  def authenticate

    if params[:user_id]
      user = User.find(params[:user_id])
      auth = Pusher[params[:channel_name]].authenticate(params[:socket_id])

      render :json => auth
    else
      render :text => 'Not authorized', :status => '403'
    end
  end

end
