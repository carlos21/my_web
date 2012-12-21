class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid

  def self.create_with_omniauth(auth)
    create! do |authorization|
      authorization.provider = auth.provider
      authorization.uid = auth.uid
    end
  end
end
