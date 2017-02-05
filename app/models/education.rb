class Education < ApplicationRecord
	has_many :employees

	validates :name, :presence => {message: "Nama pendidikan harus di isi !!"}
end
