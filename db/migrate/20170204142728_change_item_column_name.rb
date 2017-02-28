class ChangeItemColumnName < ActiveRecord::Migration[5.0]
  def change
    change_table :items do |t|
      t.rename :category_id, :item_category_id
      t.rename :unit_id, :item_unit_id
    end
  end
end
