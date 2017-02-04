class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :supplier_id
      t.integer :category_id
      t.integer :unit_id
      t.string :code
      t.integer :lot_number
      t.string :name
      t.text :spec
      t.integer :price
      t.text :desc
      t.string :halal_certificate
      t.string :warranty

      t.timestamps
    end
  end
end
