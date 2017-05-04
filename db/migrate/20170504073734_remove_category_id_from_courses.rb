class RemoveCategoryIdFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :category_id, :integer
  end
end
