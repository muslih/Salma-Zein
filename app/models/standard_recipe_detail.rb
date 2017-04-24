class StandardRecipeDetail < ApplicationRecord
  belongs_to :standard_recipe, optional: true
  belongs_to :item
end
