class AddTotalCostToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :total_cost, :decimal, :precision => 8, :scale => 2
  end
end
