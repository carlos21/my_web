class CreateCarUsers < ActiveRecord::Migration
  def change
    create_table :car_users do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
