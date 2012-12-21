class SocialUser

  attr_accessor :uid, :name, :email, :photo_url

  def initialize uid, name, email, photo_url
    @uid = uid
    @name = name
    @email = email
    @photo_url = photo_url
  end

end