class PurchaseRequestDetail < ApplicationRecord
  belongs_to :purchase_request
  belongs_to :item

  before_save :set_total
  def set_total
  	if self.qty.blank?
  		0
  	else
  		self.total = self.qty * self.item.price
  	end
  end

  def subtotal
  	if self.qty.blank?
  		0
  	else
  		self.qty * self.item.price
  	end
  end
end
