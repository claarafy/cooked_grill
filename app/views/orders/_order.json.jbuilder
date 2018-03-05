json.extract! order, :id, :quantity, :total, :pickup_address, :delivery_address, :order_date, :pickup_date, :customer_phone, :user_id, :meal_id, :created_at, :updated_at
json.url order_url(order, format: :json)
