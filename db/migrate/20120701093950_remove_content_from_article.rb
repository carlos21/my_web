class RemoveContentFromArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :content
  end
end
