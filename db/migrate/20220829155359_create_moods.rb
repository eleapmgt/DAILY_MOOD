class CreateMoods < ActiveRecord::Migration[7.0]
  def change
    create_table :moods do |t|
      t.string :content
      t.references :diary, null: false, foreign_key: true
      t.string :title
      t.integer :rating
      t.boolean :principal
      t.integer :category

      t.timestamps
    end
  end
end
