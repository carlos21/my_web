class AddColumnPhotoUrlToComments < ActiveRecord::Migration
  def change
    add_column :comments, :photo_url, :string
  end
end
