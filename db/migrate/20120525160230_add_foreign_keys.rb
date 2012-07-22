class AddForeignKeys < ActiveRecord::Migration
  add_foreign_key(:articles, :categories)
end
