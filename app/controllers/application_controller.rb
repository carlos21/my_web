class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_variables, :set_locale, :init_chat

  def init_chat 
    #@chat = Chat.find(1)
    #@user = User.get_or_set_user(session[:userid])
    #session[:userid] = @user.id
    #session[:usernickname] = @user.nickname

    #@messages = Message.includes(:user).where(:chat_id => @chat.id)
  end

  def init_variables

    @categories = Category.get_active_categories
    @article_demos = Article.get_articles_by_category_id(Constants::CATEGORY_DEMO_ID, params[:locale] || I18n.locale)
    @category_selected = Category.find_by_path(params[:category_path]) || Category.new({id: 0, path: ''})
    @locale = params[:locale] || I18n.locale
    @locale = @locale.to_s
    
    if session[:show_rating].nil?
      session[:show_rating] = true
    end

  end

  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

end
