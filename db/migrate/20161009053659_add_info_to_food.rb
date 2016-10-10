class AddInfoToFood < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :type, :string
    add_column :foods, :title, :string
    add_column :foods, :wins, :integer
    add_column :foods, :loses, :integer
  end
end
