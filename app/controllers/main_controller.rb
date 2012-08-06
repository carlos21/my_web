class MainController < ApplicationController
  before_filter :init_variables, :validate_lang, :set_locale

  def init_variables

    logger.debug params[:category_path]
    unless params[:category_path].nil?
      category = Category.get_category_by_path(params[:category_path])
      session[:selected_category] = category
      
    end

    # get the article
    unless params[:article_path].nil?
      article = Article.get_article_by_path(params[:article_path], session[:lang])
      session[:selected_article_id] = article.id
    end

  end

  def index  
    @categories = Category.get_categories

    session[:categories] = @categories
    session[:pages_path] = []
    session[:pages_path] << [ DASHBOARD_MENU, DASHBOARD_MENU_PATH ]
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def article_list  
    category = Category.find(session[:selected_category].id) 

    session[:pages_path] = []
    session[:pages_path] << [ DASHBOARD_MENU, DASHBOARD_MENU_PATH ]
    session[:pages_path] << [ category.name, category.path ]
    
    # Getting a list of articles
    @articles = Article.get_articles_by_category_id(category.id, session[:lang])

    @articles.each do |a|
      logger.debug 'CACA DE MIERDA'
      logger.debug a.category_id
    end

    respond_to do |format|
      format.html # article_list.html.erb
    end
  end

  def article_content
    
    @article  = Article.find(session[:selected_article_id]) 
    @category = Category.find(session[:selected_category].id) 

    @article.content = get_file_as_string(Rails.root.to_s + @article.route)

    # increment the visits
    @article.visits += 1

    # save the article
    @article.save

    session[:pages_path] = []
    session[:pages_path] << [ DASHBOARD_MENU, DASHBOARD_MENU_PATH ]
    session[:pages_path] << [ @category.name, @category.path ]
    session[:pages_path] << [ @article.name, @article.path ]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create_comment

    comment = Comment.new
    comment.name = params[:name]
    comment.email = params[:email]
    comment.website = params[:website]
    comment.description = params[:comments]
    comment.article_id = session[:selected_article_id]

    # save
    comment.save

    @article  = Article.find(session[:selected_article_id]) 
    @category = Category.find(session[:selected_category].id) 
    @article.content = get_file_as_string(Rails.root.to_s + @article.route)
    
    respond_to do |format|
      format.html {render :action => 'article_content'}
    end
   
  end
   
  def get_file_as_string(filename)
    data = ''
    f = File.open(filename, "r") 
    f.each_line { |line| data += line }
    return data
  end

  private
    def validate_lang
      session[:lang] = LANG_ENGLISH if session[:lang].nil?
    end

    def set_locale
      I18n.locale = session[:lang] || I18n.default_locale
    end

end
