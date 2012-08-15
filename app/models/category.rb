class Category < ActiveRecord::Base
  attr_accessible :name, :tooltip, :status, :image_url, :cant_articles, :path, :small_description

  has_many :articles

  # bd methods
  def self.get_categories()
    categories = all(:select => 'c.id, c.name, c.tooltip, c.image_url, c.path, count(a.id) as cant_articles',
                     :from   => 'categories c',
                     :joins  => 'left join articles a on c.id = a.id',
                     :group  => 'c.id, c.name, c.tooltip, c.image_url, c.path',
                     :order  => 'c.name asc') 

    return categories
  end

  def self.get_category_by_path(path_filter)
    categories = where(path: path_filter)
    return categories[0] if categories.any?
  end
end
