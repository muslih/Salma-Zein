class PurchaseOrder < ApplicationRecord
  belongs_to :purchase_request
  belongs_to :purchase_order_address
end
