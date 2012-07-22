class AddColumnSmallDescriptionToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :small_description, :string
  end
end
