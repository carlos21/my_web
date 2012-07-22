class AddColumnVisitsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :visits, :integer
  end
end
