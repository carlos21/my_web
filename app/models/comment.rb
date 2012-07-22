class Comment < ActiveRecord::Base
  attr_accessible :description, :email, :name, :website, :article_id

  belongs_to :article
end
