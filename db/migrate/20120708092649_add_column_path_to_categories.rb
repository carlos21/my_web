class AddColumnPathToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :path, :string
  end
end
