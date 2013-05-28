class Model < ActiveRecord::Base
  attr_accessible :brand_id, :description, :name
  belongs_to :brand
  has_many :cars
end
