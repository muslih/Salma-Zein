class Station < ApplicationRecord
	has_many :departments

	validates :name, :presence => {message: "Nama Station harus di isi !!"}
end
