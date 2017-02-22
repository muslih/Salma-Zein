class CreateFoodMenuDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :food_menu_details do |t|
      t.belongs_to :food_menu, foreign_key: true
      t.belongs_to :food, foreign_key: true
      t.integer :food_qty
      t.decimal :weight
      t.boolean :status

      t.timestamps
    end
  end
end
