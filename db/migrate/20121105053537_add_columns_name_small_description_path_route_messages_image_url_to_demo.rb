class AddColumnsNameSmallDescriptionPathRouteMessagesImageUrlToDemo < ActiveRecord::Migration
  def change
    add_column :demos, :small_description, :string
    add_column :demos, :path, :string
    add_column :demos, :route, :string
    add_column :demos, :messages, :integer
    add_column :demos, :image_url, :string
  end
end
