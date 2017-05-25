class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.references :rating, foreign_key: true
      t.boolean :rated
      t.integer :pressed
      t.timestamps
    end
  end
end
