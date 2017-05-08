class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :likes
      t.integer :dislikes
      t.references :courses, foreign_key: true
      t.timestamps
    end
  end
end
