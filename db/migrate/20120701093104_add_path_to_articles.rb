class AddPathToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :path, :string
  end
end
