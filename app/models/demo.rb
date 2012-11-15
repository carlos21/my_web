class Demo < ActiveRecord::Base
  attr_accessible :language, :description, :name, :url, :content
  has_many :comments

  def self.get_demos_by_language(lang) 
    demos = where(language: lang)
    return demos
  end

end
