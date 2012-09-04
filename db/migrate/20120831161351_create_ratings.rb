class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :ip
      t.decimal :rate

      t.timestamps
    end
  end
end
