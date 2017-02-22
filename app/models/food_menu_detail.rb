class FoodMenuDetail < ApplicationRecord
  belongs_to :food_menu, optional: true
  belongs_to :food
end
