class Food < ApplicationRecord
	has_many :food_recipes
	accepts_nested_attributes_for :food_recipes, allow_destroy: true

	validates :name, :presence => {message: "Nama Makanan harus di isi !!"}
end
