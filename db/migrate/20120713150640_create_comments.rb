class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :name
      t.string :website
      t.string :email
      t.string :description
      t.timestamps
      
      t.references :article
    end

  end
end
