class PurchaseOrderAddress < ApplicationRecord
	has_many :purchase_orders

	validates :name, :presence => {message: "Nama Alamat PO harus di isi !!"}
	validates :address, :presence => {message: "Alamat PO harus di isi !!"}
	validates :phone, :presence => {message: "No.telp alamat PO harus di isi !!"}

	def alamat_po
		"#{self.name} - #{self.address.first(90)}..."
	end
end
