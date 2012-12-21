require 'set'
require 'pusher'

class MainController < ApplicationController

  def change_language
    session[:lang] = params[:language]
    I18n.locale = session[:lang] || I18n.default_locale
    respond_to do |format|
      format.html {redirect_to request.original_url}
    end
  end

  def index  
    articles = Article.get_articles_for_dashboard(session[:lang])
    
    @random_articles = []
    random_array = get_random_array(40, articles.size)

    random_array.each do |index|
      @random_articles << articles[index]
    end

    @pages_path = []
    @pages_path << [ 'Dashboard', '/' ]
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def article_list  
    category = Category.find(session[:selected_category_id]) 

    @pages_path = []
    @pages_path << [ 'Dashboard', '/' ]
    @pages_path << [ category.name, category.path ]
    
    # Getting a list of articles
    @articles = Article.get_articles_by_category_id(category.id, session[:lang])

    @articles.each do |c|
      logger.debug c.messages
    end

    respond_to do |format|
      format.html # article_list.html.erb
    end
  end

  def article_content
    
    @article  = Article.find(session[:selected_article_id]) 
    @category = Category.find(@article.category_id) 

    @article.content = get_file_as_string(Rails.root.to_s + @article.route)

    # increment the visits
    @article.visits += 1

    # save the article
    @article.save

    @pages_path = []
    @pages_path << [ 'Dashboard', '/' ]
    @pages_path << [ @category.name, @category.path ]
    @pages_path << [ @article.name, @article.path ]
   
    # clear the category id if it's demo 
    session[:selected_category_id] = nil if @article.category_id == 10	 
    session[:current_url] = "#{request.protocol}#{request.host_with_port}#{request.fullpath}"

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def demo_content
    @demo  = Article.find(session[:selected_demo_id]) 
    session[:selected_category_id] = nil

    @demo.content = get_file_as_string(Rails.root.to_s + @demo.route)
    
    @pages_path = []
    @pages_path << [ 'Dashboard', '/' ]
    @pages_path << [ @demo.name, @demo.path ]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create_comment

    @article  = Article.find(session[:selected_article_id]) 
    @category = Category.find(session[:selected_category_id]) 

    comment = Comment.new
    comment.name = params[:name]
    comment.email = params[:email]
    comment.website = params[:website]
    comment.description = params[:comments]
    comment.created_at = Time.new
    comment.updated_at = Time.new
    comment.article_id = session[:selected_article_id]

    if params[:name].nil? or params[:name] == '' then
      @name_error = 'Enter a name bestia'
    elsif params[:comments].nil? or params[:comments] == '' then

    else
      # save comment
      comment.save

      # save article
      @article.update_attributes(messages: @article.messages+1)
      
      @article.content = get_file_as_string(Rails.root.to_s + @article.route)
    end

    #CommentMailer.comment_alert_message(comment, @article, @category).deliver

    respond_to do |format|
      format.html {redirect_to guides_category_and_article_url(@category.path, @article.path), :jeje => 'caca'}
    end
   
  end

  def show_socialnetworks_popup
    render 'popups/socialnetworks', :layout => false
  end
   
  def get_file_as_string(filename)
    data = ''
    f = File.open(filename, "r") 
    f.each_line { |line| data += line }
    return data
  end

  def get_random_array(n, max)
    randoms = Set.new
    loop do
        randoms << rand(max)
        return randoms.to_a if randoms.size >= n
    end
  end

  def about_me
    @pages_path = Array.new
    session[:selected_category_id] = nil
    
    @about_me = get_file_as_string(Rails.root.to_s + '/app/guides/es/others/about_me.txt')
    respond_to do |format|
      format.html
    end
  end

  def instagramcallback
    render :json => params["hub.challenge"]
  end

  

end
