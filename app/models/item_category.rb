class ItemCategory < ApplicationRecord
	has_many :items
	validates :name, :presence => {message: "Nama Kategori Barang harus di isi !!"}
end
