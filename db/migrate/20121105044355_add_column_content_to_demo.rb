class AddColumnContentToDemo < ActiveRecord::Migration
  def change
    add_column :demos, :content, :text
  end
end
