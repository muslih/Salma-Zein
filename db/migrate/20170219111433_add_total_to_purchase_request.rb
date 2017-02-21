class AddTotalToPurchaseRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_requests, :total, :integer
  end
end
