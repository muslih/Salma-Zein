class PurchaseOrder < ApplicationRecord
	belongs_to :purchase_request, optional: true
	belongs_to :purchase_order_address, optional: true
	before_create :generate_po_number, on: :create
	before_save :status_po, on: [:edit, :update]

	validates :purchase_request_id, :uniqueness => {message: "Sudah ada !!"}

	def generate_po_number
		@lpn = PurchaseOrder.last.try(:po_number[9..15])
		self.po_number = "PO-#{DateTime.now.strftime('%y%m%e')}"+(@lpn.to_i + 1).to_s.rjust(7, '0')
	end

	def status_po
		self.status = 'sudah dibayar'
	end
end
