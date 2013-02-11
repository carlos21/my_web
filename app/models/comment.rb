class Comment < ActiveRecord::Base
  attr_accessible :description, :email, :name, :website, :photo_url, :article_id

  belongs_to :article
  belongs_to :demo
end
