class CommentController < ApplicationController

  def create

    if (session[:social_user].present?) 
      # is logged
      @article  = Article.find(session[:selected_article_id]) 
      @category = Category.find(session[:selected_category_id]) 

      social_user = session[:social_user]
    
      @comment = Comment.new
      @comment.name = social_user.name
      @comment.email = social_user.email
      @comment.photo_url = social_user.photo_url
      @comment.website = params[:website]
      @comment.description = params[:comments]
      @comment.created_at = Time.new
      @comment.updated_at = Time.new
      @comment.article_id = session[:selected_article_id]

      # save comment
      @comment.save

      # save article
      @article.update_attributes(messages: @article.messages + 1)

      render 'comment/_item', :layout => false, :status => 200
    else

      # no logged // show popup
      render 'socialnetworks/_popup', :layout => false, :status => 202
    end
    
    #CommentMailer.comment_alert_message(comment, @article, @category).deliver

  end

  def delete
    comment = Comment.find(params[:id])
    comment.destroy
    @comment_id = params[:id]

    respond_to do |format|
      format.js
    end
  end

end
