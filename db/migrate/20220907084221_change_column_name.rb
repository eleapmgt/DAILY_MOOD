class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :doctor, :is_doctor
  end
end
