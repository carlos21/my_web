class Message < ActiveRecord::Base
  attr_accessible :chat_id, :description, :user_id

  belongs_to :user
  belongs_to :chat
end
