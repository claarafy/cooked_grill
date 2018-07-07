class Order < ApplicationRecord
  belongs_to :user
  belongs_to :meal
  has_one :cook, through: :meal
  belongs_to :review
  belongs_to :user, class_name: 'Driver',
                    foreign_key: 'driver_id'
end
