class PurchaseRequest < ApplicationRecord
  belongs_to :employee, optional: true
  has_many :purchase_request_details
  has_many :foods
  has_many :food_menus
  has_many :purchase_orders
  before_create :generate_pr_number

  accepts_nested_attributes_for :purchase_request_details, allow_destroy: true

  def subtotals
  	self.purchase_request_details.map { |i| i.subtotal }
  end

  def generate_pr_number
    @lpn = PurchaseRequest.last.try(:pr_number)
    self.pr_number = "PR-#{DateTime.now.strftime('%y%m%e')}"+(@lpn.to_i + 1).to_s.rjust(7, '0')
  end

  def total_all
  	subtotals.sum
  end

  def item_price_rp
    "Rp. #{helper.number_with_delimiter(self.price, delimiter: ".") }"
  end

end
