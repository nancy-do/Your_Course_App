class AddImageToCourses < ActiveRecord::Migration[5.0]
  
  def seed_image
    File.open(File.join(Rails.root, "/app/assets/images/html-programming.jpg"))
  end

  def change
    add_column :courses, :image, :string
  end
end
