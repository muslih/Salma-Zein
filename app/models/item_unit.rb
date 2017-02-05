class ItemUnit < ApplicationRecord
	has_many :items
	validates :name, :presence => {message: "Nama satuan barang harus di isi !!"}
end
