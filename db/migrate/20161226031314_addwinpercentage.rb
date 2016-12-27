class Addwinpercentage < ActiveRecord::Migration[5.0]
  def change
  	add_column :foods, :win_percentage, :decimal, precision: 5, scale: 2
  end
end
