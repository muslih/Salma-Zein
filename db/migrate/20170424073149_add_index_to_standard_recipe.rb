class AddIndexToStandardRecipe < ActiveRecord::Migration[5.0]
  def change
  	add_index :standard_recipes, :created_user_id, unique: false
  	add_index :standard_recipes, :updated_user_id, unique: false
  end
end
