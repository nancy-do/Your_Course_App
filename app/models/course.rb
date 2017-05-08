class Course < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    validates :name, presence: true, uniqueness: true
    validates :prerequisite, presence: true
    validates :description, presence: true
    validates :locations, presence: true
    validates :categories, presence: true
    validates_processing_of :image
    validate :image_size_validation
    
    has_and_belongs_to_many :locations
    has_and_belongs_to_many :categories
    belongs_to :users
    
    private
      def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
      end
end
