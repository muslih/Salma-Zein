class Supplier < ApplicationRecord
	has_many :items

	validates :name, :presence => {message: "Nama Supplier harus di isi !!"}
	validates :address, :presence => {message: "Alamat Supplier harus di isi !!"}
	validates :contact_person, :presence => {message: "Kontak Supplier harus di isi !!"}
	validates :phone, :presence => {message: "No.Telp Kontak Supplier harus di isi !!"}
	validates :business_field, :presence => {message: "Bidang Bisnis Supplier harus di isi !!"}
end
