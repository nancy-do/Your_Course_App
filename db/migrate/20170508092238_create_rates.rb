class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.references :users, foreign_key: true
      t.references :ratings, foreign_key: true
      t.boolean :rated
      t.timestamps
    end
  end
end
