class AddCategoryForeignKeyToMoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :moods, :category
    add_reference :moods, :category, null: true, foreign_key: true
  end
end
