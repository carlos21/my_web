class Car < ActiveRecord::Base
  attr_accessible :description, :name, :model_id
  belongs_to :model
end
