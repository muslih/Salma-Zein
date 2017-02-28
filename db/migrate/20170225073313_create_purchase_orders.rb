class CreatePurchaseOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_orders do |t|
      t.belongs_to :purchase_request, foreign_key: true
      t.belongs_to :purchase_order_address, foreign_key: true
      t.string :po_number
      t.datetime :arrival_estimated
      t.string :status

      t.timestamps
    end
  end
end
