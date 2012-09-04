class User < ActiveRecord::Base
  attr_accessible :email, :name, :nickname, :password, :webpage

  has_many :messages

  def self.get_or_set_user(session)
    
    if session[:user_id] == nil
      user = self.new
      user.nickname = "user_" + Time.now.to_i.to_s
      if user.save
        session[:user_id] = user.id
      end
    else
      user = self.find(session[:user_id])
    end

    # Return the user
    user
    
  end
end
