class CreateFundAdministrations < ActiveRecord::Migration[5.0]
  def change
    create_table :fund_administrations do |t|
      t.belongs_to :purchase_order, foreign_key: true
      t.integer :ammount
      t.date :date_out

      t.timestamps
    end
  end
end
