class AddDeliveryFeeToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :delivery_fee, :decimal
  end
end
