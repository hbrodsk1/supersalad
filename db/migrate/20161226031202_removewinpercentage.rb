class Removewinpercentage < ActiveRecord::Migration[5.0]
  def change
  	remove_column :foods, :win_percentage

  end
end
