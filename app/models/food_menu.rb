class FoodMenu < ApplicationRecord
	has_many :food_menu_details
  # belongs_to :cycle
  # belongs_to :flight_class
  accepts_nested_attributes_for :food_menu_details, allow_destroy: true
end
