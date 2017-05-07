class RemoveLocationIdFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :location_id, :integer
  end
end
