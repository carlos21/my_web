class Comment < ActiveRecord::Base
  attr_accessible :description, :email, :name, :website, :article_id, :photo_url

  belongs_to :article
  belongs_to :demo
end
