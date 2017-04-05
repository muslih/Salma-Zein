class StandardRecipe < ApplicationRecord
  belongs_to :cycle, optional: true
  belongs_to :flight_type, optional: true

  validates :name, :presence => {message: "Nama Standard Recipe harus di isi !!"}
  validates :cycle_id, :presence => {message: "Cycle harus di isi !!"}
  validates :flight_type_id, :presence => {message: "Penerbangan harus di isi !!"}
  validates :pax_qty, :presence => {message: "Jumlah pax harus di isi !!"}
end
