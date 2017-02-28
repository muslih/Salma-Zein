class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.integer :station_id
      t.string :name
      t.string :manager

      t.timestamps
    end
  end
end
