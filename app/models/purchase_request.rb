class PurchaseRequest < ApplicationRecord
  attr_accessor :number
  belongs_to :employee, optional: true
  belongs_to :created_user , :class_name => 'User', optional: true
  belongs_to :updated_user , :class_name => 'User', optional: true
  has_many :purchase_request_details
  has_many :standard_recipes
  has_many :purchase_orders

  before_create :generate_pr_number, on: :create
  before_save :subtotals
  before_save :total_all


  accepts_nested_attributes_for :purchase_request_details, allow_destroy: true

  validates :date_required, :presence => {message: "Tanggal diperlukan harus di isi !!"}
  validates :request_reason, :presence => {message: "Alasan pengajuan harus di isi !!"}
  

  def standardrecipe
    "#{self.try(:cycle).try(:name)} - #{self.try(:flight_type).try(:name)} (#{self.try(:flight_type).try(:flight_class).try(:name)})"
  end

  def subtotals
  	self.purchase_request_details.map { |i| i.subtotal }
  end

  def generate_pr_number
    @lpn = PurchaseRequest.last.pr_number[9..15]
    self.pr_number = "PR-#{DateTime.now.strftime('%y%m%e')}"+(@lpn.to_i + 1).to_s.rjust(7, '0')
  end

  def total_all
  	self.total = subtotals.sum
  end

  def item_price_rp
    "Rp. #{helper.number_with_delimiter(self.price, delimiter: ".") }"
  end

  def updated_info
    "#{self.try(:updated_user).try(:employee).try(:name)} pada #{self.updated_at.try(:strftime,  '%H:%M %p , %d %B %Y')}"
  end

  def generate_po_number(number)
    @lpn = PurchaseOrder.last.po_number[9..15]
    @po_code = "PO-#{DateTime.now.strftime('%y%m%e')}"+(@lpn.to_i + number).to_s.rjust(7, '0')
  end

end
