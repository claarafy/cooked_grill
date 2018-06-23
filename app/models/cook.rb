class Cook < ApplicationRecord
  has_many :meals
  has_many :orders, through: :meals
  has_many :reviews, through: :meals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_image, ImageUploader

  # validate :valid_zip_code
  #
  # def valid_zip_code
  #   if ZipCodes.identify(zip) == nil
  #     errors.add(:zip, " is invalid")
  #   end
  # end

end
