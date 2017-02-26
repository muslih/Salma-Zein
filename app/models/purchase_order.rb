class PurchaseOrder < ApplicationRecord
	belongs_to :purchase_request, optional: true
	belongs_to :purchase_order_address, optional: true
	before_create :generate_po_number

	def generate_po_number
		@lpn = PurchaseOrder.last.po_number
		self.po_number = "PO-#{DateTime.now.strftime('%y%m%e')}"+(@lpn.to_i + 1).to_s.rjust(7, '0')
	end
end
