class Comment < ActiveRecord::Base
  attr_accessible :description, :email, :name, :website, :article_id
  validates_presence_of :name, :message => 'enter this mal parido'

  belongs_to :article
  belongs_to :demo
end
