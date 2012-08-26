class AddMessagesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :messages, :integer
  end
end
