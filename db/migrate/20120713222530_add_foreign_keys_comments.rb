class AddForeignKeysComments < ActiveRecord::Migration
  add_foreign_key(:comments, :articles)
end
