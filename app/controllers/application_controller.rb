class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :validate_lang, :init_variables, :set_locale, :init_chat

  def init_chat 
    @chat = Chat.find(1)
    @user = User.get_or_set_user(session[:userid])
    session[:userid] = @user.id
    session[:usernickname] = @user.nickname

    @messages = Message.includes(:user).where(:chat_id => @chat.id)
  end

  def init_variables

    @categories = Category.get_categories
    @demos = Demo.get_demos_by_language(session[:lang])

    unless params[:category_path].nil?
      @category = Category.get_category_by_path(params[:category_path])
      session[:selected_category_id] = @category.id
    end

    # get the article
    unless params[:article_path].nil?
      article = Article.get_article_by_path(params[:article_path], session[:lang])
      session[:selected_article_id] = article.id
    end

    if session[:show_rating].nil?
      session[:show_rating] = true
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
