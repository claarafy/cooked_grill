class Review < ApplicationRecord
  belongs_to :user
  belongs_to :meal
  has_one :cook, :through => :meal 
end
