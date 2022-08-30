class AddCategoryToRewards < ActiveRecord::Migration[7.0]
  def change
    add_column :rewards, :category, :string
  end
end
