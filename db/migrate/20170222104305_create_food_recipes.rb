class CreateFoodRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :food_recipes do |t|
      t.belongs_to :food, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.integer :qty

      t.timestamps
    end
  end
end
