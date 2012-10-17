class Demo < ActiveRecord::Base
  attr_accessible :language, :description, :name, :url

  def self.get_demos_by_language(lang) 
    demos = where(language: lang)
    return demos
  end

end
