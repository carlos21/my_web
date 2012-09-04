class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :password
      t.string :email
      t.string :webpage

      t.timestamps
    end
  end
end
