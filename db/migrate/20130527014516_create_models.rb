class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.string :description
      t.integer :brand_id

      t.timestamps
    end
  end
end
