class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :foods, :type, :kind
  end
end
