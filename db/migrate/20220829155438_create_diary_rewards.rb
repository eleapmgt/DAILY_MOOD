class CreateDiaryRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :diary_rewards do |t|
      t.references :diary, null: false, foreign_key: true
      t.references :reward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
