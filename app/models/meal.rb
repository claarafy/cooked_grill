class Meal < ApplicationRecord
  belongs_to :cook
  mount_uploader :images, ImageUploader

end
