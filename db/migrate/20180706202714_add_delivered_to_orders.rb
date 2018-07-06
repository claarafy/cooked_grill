class AddDeliveredToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :delivered, :boolean
  end
end
