class Article < ActiveRecord::Base
  attr_accessible :category_id, :name, :small_description, :content, :path, :route, :language, :visits, :messages
  attr_accessor :content, :messages

  belongs_to :category
  has_many :comments

  def self.get_article_by_path(path_filter, lang_filter)
    articles = where(path: path_filter, language: lang_filter)
    return articles[0] if articles.any?
  end

  def self.get_articles_by_category_id(category_id, lang_filter)
    articles = where(category_id: category_id, language: lang_filter)
    return articles
  end
end
