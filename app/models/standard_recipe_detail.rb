class StandardRecipeDetail < ApplicationRecord
  belongs_to :standard_recipe
  belongs_to :item
end
