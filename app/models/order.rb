class Order < ApplicationRecord
  belongs_to :user
  belongs_to :meal
  has_one :cook, through: :meal
  belongs_to :review
end
