class ChangeColumnLosses < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :foods, :loses, 0
  end
end
