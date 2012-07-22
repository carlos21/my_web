class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.integer :category_id

      t.timestamps

      t.references :category
    end
  end
end
