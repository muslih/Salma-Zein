class Gender < ApplicationRecord
	has_many :employees

	validates :name, :presence => {message: "Gender harus di isi !!"}
end
