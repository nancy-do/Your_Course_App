class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer :building
      t.integer :level
      t.integer :room

      t.timestamps
    end
  end
end
