require 'set'

class MainController < ApplicationController
  before_filter :validate_lang, :init_variables, :set_locale

  def change_language
    session[:lang] = params[:language]
    I18n.locale = session[:lang] || I18n.default_locale
    respond_to do |format|
      format.html {redirect_to request.original_url}
    end
  end

  def init_variables

    @categories = Category.get_categories

    unless params[:category_path].nil?
      @category = Category.get_category_by_path(params[:category_path])
      session[:selected_category_id] = @category.id
    end

    # get the article
    unless params[:article_path].nil?
      article = Article.get_article_by_path(params[:article_path], session[:lang])
      session[:selected_article_id] = article.id
    end

  end

  def index  
    articles = Article.includes(:category).where(:language => session[:lang])
    
    @random_articles = []
    random_array = get_random_array(24, articles.size)

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
    @category = Category.find(session[:selected_category_id]) 

    @article.content = get_file_as_string(Rails.root.to_s + @article.route)

    # increment the visits
    @article.visits += 1

    # save the article
    @article.save

    @pages_path = []
    @pages_path << [ 'Dashboard', '/' ]
    @pages_path << [ @category.name, @category.path ]
    @pages_path << [ @article.name, @article.path ]

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

  private
    def validate_lang
      session[:lang] = 'es' if session[:lang].nil?
    end

    def set_locale
      I18n.locale = session[:lang] || I18n.default_locale
    end

end
