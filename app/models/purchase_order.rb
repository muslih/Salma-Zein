class PurchaseOrder < ApplicationRecord
	belongs_to :purchase_request, optional: true
	belongs_to :purchase_order_address, optional: true
	before_create :generate_po_number, on: :create

	def generate_po_number
		@lpn = PurchaseOrder.last.try(:po_number[9..15])
		self.po_number = "PO-#{DateTime.now.strftime('%y%m%e')}"+(@lpn.to_i + 1).to_s.rjust(7, '0')
	end
end
