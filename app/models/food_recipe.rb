class FoodRecipe < ApplicationRecord
  belongs_to :food, optional: true
  belongs_to :item
end
