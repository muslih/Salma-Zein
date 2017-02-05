class Position < ApplicationRecord
	belongs_to :department, optional: :true
	has_many :employees

	validates :department_id, :presence => {message: "Departemen harus di isi !!"}
	validates :name, :presence => {message: "Nama Posisi / jabatan harus di isi !!"}
end
