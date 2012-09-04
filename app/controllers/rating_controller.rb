class RatingController < ApplicationController

  def change_rating
    
    rating = Rating.new
    rating.ip = request.env['REMOTE_ADDR']
    rating.rate = params[:rate]
    rating.created_at = Time.new
    rating.updated_at = Time.new
    rating.save

    session[:show_rating] = false

    respond_to do |format|
      format.js
    end
  end

end
