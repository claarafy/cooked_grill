class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :total, :pickup_address,
             :delivery_address, :order_date, :pickup_date, :customer_phone, :user_id,
             :created_at, :updated_at, :total_cost, :paid, :cook_total, :pickup, :delivery,
             :reviewed, :review_id, :delivery_fee, :delivered, :driver_id
end
