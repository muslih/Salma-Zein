class ChangePrNumberDataType < ActiveRecord::Migration[5.0]
  def change
  	change_column :purchase_requests, :pr_number, :string
  end
end
