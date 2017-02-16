class CreatePurchaseRequestDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_request_details do |t|
      t.belongs_to :purchase_request, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.integer :qty
      t.integer :total

      t.timestamps
    end
  end
end
