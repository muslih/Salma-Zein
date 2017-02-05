class Employee < ApplicationRecord
	belongs_to :gender, optional: :true
	belongs_to :religion, optional: :true
	belongs_to :position, optional: :true
	belongs_to :education, optional: :true

	validates :gender_id, :presence => {message: "Gender harus di isi !!"}
	validates :religion_id, :presence => {message: "Agama harus di isi !!"}
	validates :position_id, :presence => {message: "Posisi / jabatan harus di isi !!"}
	validates :education_id, :presence => {message: "Pendidikan harus di isi !!"}
	validates :name, :presence => {message: "Nama Pegawai harus di isi !!"}
	validates :role, :presence => {message: "Role Pegawai harus di isi !!"}
	validates :age, :presence => {message: "Usia Pegawai harus di isi !!"}
	validates :birth_place, :presence => {message: "Tempat Lahir Pegawai harus di isi !!"}
	validates :birth_date, :presence => {message: "Tanggal Lahir Pegawai harus di isi !!"}

end
