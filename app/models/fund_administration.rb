class FundAdministration < ApplicationRecord
  belongs_to :purchase_order

  validates :purchase_order_id, :uniqueness => {message: "Sudah Dibayar !!"}
end
