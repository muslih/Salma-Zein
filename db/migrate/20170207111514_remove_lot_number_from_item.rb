class RemoveLotNumberFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :lot_number, :integer
  end
end
