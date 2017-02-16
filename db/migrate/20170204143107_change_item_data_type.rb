class ChangeItemDataType < ActiveRecord::Migration[5.0]
  def up
  	change_column :items, :item_category_id, :integer
  	change_column :items, :item_unit_id, :integer
  	change_column :items, :warranty, :boolean
  end

  def down
  	change_column :items, :item_category_id, :string
  	change_column :items, :item_unit_id, :string
  	change_column :items, :warranty, :date
  end
end
