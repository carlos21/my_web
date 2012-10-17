class AddColumnLanguageToDemos < ActiveRecord::Migration
  def change
    add_column :demos, :language, :string
  end
end
