class CarUserController < ApplicationController

	def validate_login
		user = CarUser.where(username: params['username'], password: params['password']).first

		if user.present?
			hash = {}
	    hash['brands'] = []
	    
	    brands = Brand.where(status: 'A')

	    brands.each do |b|
	      brand_hash = b.attributes
	      brand_hash['encoded_image'] = ActiveSupport::Base64.encode64(open(Rails.public_path + "/cars_images/" + b.image) { |io| io.read })
	      brand_hash['models'] = []
	      models = b.models

	      models.each do |m|
	        cars = m.cars
	        model_hash = m.attributes
	        model_hash['cars'] = cars
	        brand_hash['models'] << model_hash
	      end
	      
	      hash['brands'] << brand_hash
	    end

			render json: hash
		else
			render json: {}
		end
	end

end