class ArticleController < ApplicationController

  def index
    # Redirect
    #respond_to do |format|
    #  format.html # index.html.erb
    #end

    redirect_to ''
  end

  def guide_html5 

    respond_to do |format|
      format.html # index.html.erb
    end

  end

end
