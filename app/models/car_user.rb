class CarUser < ActiveRecord::Base
  attr_accessible :password, :username
end
