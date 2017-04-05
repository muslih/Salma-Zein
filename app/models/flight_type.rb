class FlightType < ApplicationRecord
  belongs_to :flight_class, optional: true

  validates :name, :presence => {message: "tipe penerbangan harus di isi !!"}
  validates :flight_class_id, :presence => {message: "kelas penerbangan harus di isi !!"}

  def flightclasstype
    "#{self.flight_class.try(:name)} - #{self.try(:name)}"
  end
end
