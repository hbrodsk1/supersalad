class AddRoundsPlayedToFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :rounds_played, :integer
  end
end
