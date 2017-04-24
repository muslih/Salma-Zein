class StandardRecipe < ApplicationRecord
  belongs_to :cycle, optional: true
  belongs_to :flight_type, optional: true
  belongs_to :created_user , :class_name => 'User', optional: true
  belongs_to :updated_user , :class_name => 'User', optional: true
  has_many :standard_recipe_details
  accepts_nested_attributes_for :standard_recipe_details, allow_destroy: true

  validates :name, :presence => {message: "Nama Standard Recipe harus di isi !!"}
  validates :cycle_id, :presence => {message: "Cycle harus di isi !!"}
  validates :flight_type_id, :presence => {message: "Penerbangan harus di isi !!"}
  validates :pax_qty, :presence => {message: "Jumlah pax harus di isi !!"}

  def standardrecipe
    "#{self.try(:cycle).try(:name)} - #{self.try(:flight_type).try(:name)} (#{self.try(:flight_type).try(:flight_class).try(:name)})"
  end

  def created_info
    "#{self.try(:created_user).try(:employee).try(:name)} at #{self.try(:created_at).try(:strftime,  '%H:%M %p , %d %B %Y')}"
  end

  def updated_info
    "#{self.try(:updated_user).try(:employee).try(:name)} at #{self.updated_at.try(:strftime,  '%H:%M %p , %d %B %Y')}"
  end
end
