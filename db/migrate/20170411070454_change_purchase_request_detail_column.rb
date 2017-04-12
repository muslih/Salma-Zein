class ChangePurchaseRequestDetailColumn < ActiveRecord::Migration[5.0]
  def change
  	change_table :purchase_request_details do |t|
      t.rename :total, :sub_total
    end
  end
end
