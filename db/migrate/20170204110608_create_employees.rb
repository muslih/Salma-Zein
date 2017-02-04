class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :role
      t.integer :age
      t.string :birth_place
      t.date :birth_date
      t.integer :gender_id
      t.integer :religion_id
      t.integer :position_id
      t.integer :education_id
      t.string :experience
      t.string :skill

      t.timestamps
    end
  end
end
