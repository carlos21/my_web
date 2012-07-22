class AddRouteToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :route, :string
  end
end
