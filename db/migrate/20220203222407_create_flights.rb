class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.integer :departure
      t.integer :arrival
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end
