class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid

  def self.create_with_omniauth(auth)
    create! do |authorization|
      authorization.provider = auth.provider
      authorization.uid = auth.uid
    end
  end

  def self.find_by_provider_and_uid(auth)
    authorizations = where(uid: auth.uid, provider: auth.provider.to_s)
    authorizations.first
  end
end
