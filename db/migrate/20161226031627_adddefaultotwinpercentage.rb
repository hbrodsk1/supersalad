class Adddefaultotwinpercentage < ActiveRecord::Migration[5.0]
def change
  	change_column_default :foods, :win_percentage, 0
  end
end
