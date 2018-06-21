class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :cooks, :default_delivery_address, :default_pickup_address
  end
end
