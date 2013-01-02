require 'set'
require 'pusher'

class MainController < ApplicationController

  def index  
    articles = Article.get_articles_for_dashboard(@locale)
    
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
    @pages_path = []
    @pages_path << ['Dashboard', '/' ]
    @pages_path << [@category_selected.name, @category_selected.path]
    
    # Getting a list of articles
    @articles = Article.get_articles_by_category_id(@category_selected.id, @locale)

    @articles.each do |c|
      logger.debug c.messages
    end

    respond_to do |format|
      format.html # article_list.html.erb
    end
  end

  def article_content

    @article_selected  = Article.find_by_path_and_language(params[:article_path], @locale) 
    @article_selected.content = get_file_as_string(Rails.root.to_s + @article_selected.route)

    # increment the visits
    @article_selected.visits += 1

    # save the article
    @article_selected.save

    @pages_path = []
    @pages_path << [ 'Dashboard', '/' ]
    @pages_path << [ @category_selected.name, @category_selected.path ]
    @pages_path << [ @article_selected.name, @article_selected.path ]

    session[:current_url] = "#{request.protocol}#{request.host_with_port}#{request.fullpath}"

    respond_to do |format|
      format.html 
    end
  end

  def demo_content
    @article_selected  = Article.find_by_path_and_language(params[:article_path], @locale) 
    @category_selected.id = Constants::CATEGORY_DEMO_ID
    @category_selected.path = ''

    @article_selected.content = get_file_as_string(Rails.root.to_s + @article_selected.route)

    # increment the visits
    @article_selected.visits += 1

    # save the article
    @article_selected.save

    @pages_path = []
    @pages_path << [ 'Dashboard', '/' ]
    @pages_path << [ @article_selected.name, @article_selected.path ]

    session[:current_url] = "#{request.protocol}#{request.host_with_port}#{request.fullpath}"

    respond_to do |format|
      format.html { render 'main/article_content' }
    end
  end

  def create_comment

    @article  = Article.find_by_path(params[:article_path]) 

    comment = Comment.new
    comment.name = params[:name]
    comment.email = params[:email]
    comment.website = params[:website]
    comment.description = params[:comments]
    comment.created_at = Time.new
    comment.updated_at = Time.new
    comment.article_id = @article.id

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
      format.html {redirect_to guides_category_and_article_url(@locale, @category_selected.path, @article.path), :jeje => 'caca'}
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
    
    @about_me = get_file_as_string(Rails.root.to_s + '/app/guides/' + @locale + '/others/about_me.txt')
    respond_to do |format|
      format.html
    end
  end

  def download_cv
    send_file(Rails.root.to_s + '/files/' + @locale + '/CV.pdf', :filename => 'carlos-duclos-cv.pdf', :disposition => 'inline', :type => "application/pdf")
  end

  def change_language
    if request.referer.include? ('/' + Constants::LANG_ENGLISH + '/')
      current_locale = Constants::LANG_ENGLISH
    end

    if request.referer.include? ('/' + Constants::LANG_SPANISH + '/')
      current_locale = Constants::LANG_SPANISH
    end

    I18n.locale = params[:locale]

    logger.debug current_locale
    logger.debug params[:locale]
    logger.debug request.referer

    if current_locale.nil?
      # add the locale to the url, next to the domain
      redirect_to "#{request.protocol}#{request.host_with_port}" + '/' + params[:locale]
    else
      # replace the new locale
      redirect_to request.referer.sub!('/' + current_locale + '/', '/' + params[:locale] + '/')
    end
    
  end

end

