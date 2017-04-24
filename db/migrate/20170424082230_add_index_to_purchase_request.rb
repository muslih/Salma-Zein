class AddIndexToPurchaseRequest < ActiveRecord::Migration[5.0]
  def change
  	add_index :purchase_requests, :updated_user_id, unique: false
  end
end
