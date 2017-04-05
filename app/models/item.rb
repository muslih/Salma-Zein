class Item < ApplicationRecord
	belongs_to :item_category, optional: :true
	belongs_to :item_unit, optional: :true
	belongs_to :supplier, optional: :true
	has_many :purchase_request_details

	validates :item_category_id, :presence => {message: "Kategori Barang harus di isi !!"}
	validates :item_unit_id, :presence => {message: "Satuan Barang harus di isi !!"}
	validates :supplier_id, :presence => {message: "Supplier harus di isi !!"}
	validates :code, :presence => {message: "Kode Barang harus di isi !!"}
	validates :name, :presence => {message: "Nama Barang harus di isi !!"}
	# validates :spec, :presence => {message: "Spesifikasi Barang harus di isi !!"}
	validates :price, :presence => {message: "Harga Barang harus di isi !!"}
	# validates :desc, :presence => {message: "Deskripsi Barang harus di isi !!"}

	def itemunit
	    "#{self.try(:name)} -- (#{self.try(:item_unit).try(:name)})"
	  end

	def price_rp
	  "Rp. #{helper.number_with_delimiter(self.price, delimiter: ".") }"
	end

	 private
	def helper
		Helper.instance
	end

	class Helper
		include Singleton
		include ActionView::Helpers::NumberHelper
	end

	def name_item
		"#{self.name} - (#{self.item_unit.name})"
	end
end
