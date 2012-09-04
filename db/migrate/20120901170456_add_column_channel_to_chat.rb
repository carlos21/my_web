class AddColumnChannelToChat < ActiveRecord::Migration
  def change
    add_column :chats, :channel, :string
  end
end
