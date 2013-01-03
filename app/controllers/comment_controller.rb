class CommentController < ApplicationController

  def create

    if (session[:social_user].present?) 
      # is logged
      @article  = Article.find_by_path(params[:article_path]) 
      @category = Category.find(@article.category_id)
      articles = Article.get_articles_by_path(params[:article_path])
      social_user = session[:social_user]

      articles.each do |a|
        @comment = Comment.new
        @comment.name = social_user.name
        @comment.email = social_user.email
        @comment.photo_url = social_user.photo_url
        @comment.website = params[:website]
        @comment.description = params[:comments]
        @comment.created_at = Time.new
        @comment.updated_at = Time.new
        @comment.article_id = a.id

        # save comment
        @comment.save

        # save article
        a.update_attributes(messages: a.messages + 1)
      end

      render 'comment/_item', :layout => false, :status => 200
    else
      @form_title = t(:your_session_has_expired_label)
      # no logged // show popup
      render 'socialnetworks/_ask_for_login', :layout => false, :status => 202
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
