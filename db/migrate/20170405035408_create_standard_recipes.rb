class CreateStandardRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :standard_recipes do |t|
      t.belongs_to :cycle, foreign_key: true
      t.belongs_to :flight_type, foreign_key: true
      t.string :name
      t.integer :pax_qty

      t.timestamps
    end
  end
end
