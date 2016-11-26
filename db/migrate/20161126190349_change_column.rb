class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :foods, :wins, 0
  end
end
