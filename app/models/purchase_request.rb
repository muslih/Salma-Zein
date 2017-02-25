class PurchaseRequest < ApplicationRecord
  belongs_to :employee, optional: true
  has_many :purchase_request_details
  has_many :foods
  has_many :food_menus
  has_many :purchase_orders
  accepts_nested_attributes_for :purchase_request_details, allow_destroy: true

  def subtotals
  	self.purchase_request_details.map { |i| i.subtotal }
  end

  def generate_pr_number
    @lpn = PurchaseRequest.last.pr_number
    self.pr_number = (@lpn.to_i + 1).to_s.rjust(5, '0')
  end

  def total_all
  	subtotals.sum
  end

  def total_rp
    "Rp. #{helper.number_with_delimiter(self.total, delimiter: ".") }"
  end

  def item_price_rp
    "Rp. #{helper.number_with_delimiter(self.price, delimiter: ".") }"
  end

  private
  def helper
    Helper.instance
  end

  class Helper
    include Singleton
    include ActionView::Helpers::NumberHelper
  end
end
