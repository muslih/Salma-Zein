class PurchaseRequest < ApplicationRecord
  belongs_to :employee
  has_many :purchase_request_details
  accepts_nested_attributes_for :purchase_request_details, allow_destroy: true

  def subtotals
  	self.purchase_request_details.map { |i| i.subtotal }
  end

  def total_all
  	subtotals.sum
  end
end
