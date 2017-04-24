class AddColumnToPurchaseRequest < ActiveRecord::Migration[5.0]
  def change
  	add_column :purchase_requests, :updated_user_id , :integer, references: :user
  end
end
