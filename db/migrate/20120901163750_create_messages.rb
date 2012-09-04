class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :description
      t.integer :chat_id
      t.integer :user_id

      t.timestamps
    end
  end
end
