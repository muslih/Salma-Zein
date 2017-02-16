class Department < ApplicationRecord
	belongs_to :station, optional: :true
	has_many :positions

	validates :station_id, :presence => {message: "Station harus di isi !!"}
	validates :name, :presence => {message: "Nama Departemen harus di isi !!"}
	validates :manager, :presence => {message: "Nama Manager harus di isi !!"}
end
