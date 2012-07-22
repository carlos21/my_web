class CommentController < ApplicationController

  def create
    comment = Comment.new
    comment.name = params[:name]
    comment.email = params[:email]
    comment.website = params[:website]
    comment.description = params[:description]

    # save
    comment.save

    respond_to do |format|
      format.html {render :controller => 'main', :action => 'article_content'}
    end
  end

end
