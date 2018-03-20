class Meal < ApplicationRecord
  belongs_to :cook
  # has_many :meals
  has_many :reviews

  mount_uploader :images, ImageUploader

end
