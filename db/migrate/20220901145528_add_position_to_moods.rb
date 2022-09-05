class AddPositionToMoods < ActiveRecord::Migration[7.0]
  def change
    add_column :moods, :position, :integer
  end
end
