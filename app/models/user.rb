class User < ActiveRecord::Base
  attr_accessible :email, :name, :nickname, :password, :webpage

  has_many :messages

  def self.get_or_set_user(user_id)
    logger.debug 'user_id es: ' 
    logger.debug user_id

    if user_id.nil?
      user = self.new
      user.nickname = "user_" + Time.now.to_i.to_s
      if user.save
        user_id = user.id
      end
    else
      user = self.find(user_id)
    end

    # Return the user
    user
    
  end
end
