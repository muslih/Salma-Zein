class CreateStandardRecipeDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :standard_recipe_details do |t|
      t.belongs_to :standard_recipe, foreign_key: true
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
