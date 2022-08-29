class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.string :content_url

      t.timestamps
    end
  end
end
