class Brand < ActiveRecord::Base
  attr_accessible :description, :name, :image, :status
  has_many :models
end
