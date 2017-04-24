class AddColumnToStandardRecipe < ActiveRecord::Migration[5.0]
  def change
  	add_column :standard_recipes, :created_user_id , :integer, references: :user
  	add_column :standard_recipes, :updated_user_id , :integer, references: :user
  end
end
