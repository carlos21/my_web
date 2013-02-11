class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid

  def self.create_with_omniauth(auth)
    create! do |authorization|
      authorization.provider = auth.provider
      authorization.uid = auth.uid
    end
  end

  def self.find_by_provider_and_uid(uid, provider)
    authorizations = where(uid: uid, provider: provider)
    authorizations.first
  end
end
