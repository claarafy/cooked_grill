class Order < ApplicationRecord
  belongs_to :user
  belongs_to :meal
  has_one :cook, through: :meal
  belongs_to :review
  has_one :new_delivery_address
  accepts_nested_attributes_for :new_delivery_address
end
