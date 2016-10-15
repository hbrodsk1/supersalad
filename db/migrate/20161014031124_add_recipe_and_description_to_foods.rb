class AddRecipeAndDescriptionToFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :recipe, :text
    add_column :foods, :description, :text
  end
end
