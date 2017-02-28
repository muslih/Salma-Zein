class CreatePurchaseOrderAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_order_addresses do |t|
      t.string :name
      t.text :address
      t.string :pic
      t.integer :phone

      t.timestamps
    end
  end
end
