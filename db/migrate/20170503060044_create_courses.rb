class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :prerequisite
      t.string :description
      
      #######################################
      t.integer :category_id, :null => false, :references => [:categories, :id]
      t.integer :location_id, :null => false, :references => [:locations, :id]

      t.timestamps
    end
  end
end
