class PurchaseOrder < ApplicationRecord
	before_create :generate_po_number
	belongs_to :purchase_request, optional: true
	belongs_to :purchase_order_address, optional: true

	def generate_po_number
	@lpn = PurchaseOrder.last.po_number
	self.po_number = "PO-#{DateTime.now.strftime('%Y')}"+(@lpn.to_i + 1).to_s.rjust(7, '0')
	end
end
