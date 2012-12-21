class AuthorizationController < ApplicationController

  def callback
    auth = request.env["omniauth.auth"]
    authorization = Authorization.find_by_provider_and_uid(auth.provider, auth.uid) || Authorization.create_with_omniauth(auth)
    session[:uid] = auth.uid

    social_user = SocialUser.new(auth.uid, auth.info.name, auth.info.email, auth.info.image)

    session[:social_user] = social_user

    #render text: auth.uid
    redirect_to session[:current_url]

  end  
  
  def destroy
    session[:uid] = nil
  end

end
