class FacebookController < ActionController::Base

  def create
    user = User.create_user_from_facebook(env["omniauth.auth"])
    session[:user_id] = user.id
    
  end

  def index
    if session[:user_id].nil?
      redirect_to 'http://carlos21.com/auth/facebook'
      return
    end

    user = User.find(session[:user_id])

    #if (user.provider == 'facebook')

  end 

end