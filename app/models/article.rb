class Article < ActiveRecord::Base
  attr_accessible :category_id, :name, :small_description, :content, :path, :route, :language, :visits, :messages, :image_url
  attr_accessor :content

  belongs_to :category
  has_many :comments

  def self.get_articles_for_dashboard(lang)
    self.includes(:category).where('language = ? and category_id != ?', lang, 10)
  end

  def self.get_article_by_path(path_filter, lang_filter)
    articles = where(path: path_filter, language: lang_filter)
    return articles[0] if articles.any?
  end

  def self.get_articles_by_category_id(category_id, lang_filter)
    articles = Article.select("articles.*")
                      .where("articles.category_id = ? and articles.language = ?", category_id, lang_filter)
                      .order('articles.created_at desc')

    #articles = Article.select("articles.*, count(c.id) as messages")
    #                  .joins('left join comments c on c.article_id = articles.id')
    #                  .where("articles.category_id = #{category_id} and articles.language = '#{lang_filter}'")
    #                  .order('articles.name asc')
    #                  .group("articles.id, articles.name, articles.small_description, articles.path, articles.route, articles.language, articles.visits, articles.image_url, articles.category_id")

    #articles = Article.all(:select => "articles.*, count(c.id) as messages_count",
    #                       :joins => 'left join comments c on c.article_id = articles.id',
    #                       :group => "articles.id, articles.name, articles.small_description, articles.path, articles.route, articles.language, articles.visits, articles.image_url, articles.category_id",
    #                       :order => 'articles.name asc'
    #                      ).where("articles.category_id = #{category_id} and articles.language = '#{lang_filter}'")
    return articles
  end

  def self.get_articles_by_path(path)
    where(path: path)
  end
end
