class FoodMenu < ApplicationRecord
	belongs_to :purchase_request, optional: true
	belongs_to :cycle, optional: true
	belongs_to :flight_class, optional: true
	has_many :food_menu_details

	# belongs_to :cycle
	# belongs_to :flight_class
	accepts_nested_attributes_for :food_menu_details, allow_destroy: true

	validates :name, :presence => {message: "Nama Menu harus di isi !!"}
end
