class PurchaseRequestDetail < ApplicationRecord
  belongs_to :purchase_request, optional: true
  belongs_to :item

  

  before_save :set_total
  def set_total
  	if self.qty.blank?
  		0
  	else
  		self.sub_total = self.qty * self.item.price
  	end
  end

  def subtotal
  	if self.qty.blank?
  		0
  	else
  		self.qty * self.item.price
  	end
  end

  def total_rp
    "Rp. #{helper.number_with_delimiter(self.total, delimiter: ".") }"
  end

  def show_unit
    self.try(:item).try(:item_unit).try(:name)
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
