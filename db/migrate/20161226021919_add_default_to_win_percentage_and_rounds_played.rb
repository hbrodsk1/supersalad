class AddDefaultToWinPercentageAndRoundsPlayed < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :foods, :rounds_played, 0
  end
end
