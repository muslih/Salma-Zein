class CreateFlightTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :flight_types do |t|
      t.string :name
      t.belongs_to :flight_class, foreign_key: true

      t.timestamps
    end
  end
end
