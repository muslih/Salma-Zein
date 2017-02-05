class Religion < ApplicationRecord
	has_many :employees

	validates :name, :presence => {message: "Agama harus di isi !!"}
end
