class AddColumnSmallDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :small_description, :string
  end
end
