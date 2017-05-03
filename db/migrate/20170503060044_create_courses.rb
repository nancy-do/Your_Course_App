class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :prerequisite
      t.string :description
      t.integer :category_id
      t.integer :location_id

      t.timestamps
    end
  end
end
