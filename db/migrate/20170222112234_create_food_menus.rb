class CreateFoodMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :food_menus do |t|
      t.belongs_to :cycle, foreign_key: true
      t.belongs_to :flight_class, foreign_key: true
      t.string :name
      t.date :start_date_peroid
      t.date :date_peroid_end

      t.timestamps
    end
  end
end
