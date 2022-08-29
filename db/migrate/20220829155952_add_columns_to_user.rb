class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :doctor, :boolean, default: false
    add_column :users, :moods_visibility, :boolean
    add_reference :users, :user, foreign_key: true
    rename_column :users, :user_id, :doctor_id
  end
end
