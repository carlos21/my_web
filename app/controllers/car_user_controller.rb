class CarUserController < ApplicationController

	def validate_login
		user = CarUser.where(username: params['username'], password: ['password']).first

		if user.present?
			render json: user.to_json
		else
			render json: {}
		end
	end

end