class CreatePurchaseRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_requests do |t|
      t.belongs_to :employee, foreign_key: true
      t.integer :pr_number
      t.date :date_created
      t.date :date_required
      t.string :request_reason
      t.boolean :status
      t.string :status_desc

      t.timestamps
    end
  end
end
