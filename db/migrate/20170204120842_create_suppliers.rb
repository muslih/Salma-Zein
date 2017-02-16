class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :contact_person
      t.string :phone
      t.string :business_field
      t.string :management_system

      t.timestamps
    end
  end
end
