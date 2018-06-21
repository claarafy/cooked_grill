class AddDefaultDeliveryAddressToCooks < ActiveRecord::Migration[5.1]
  def change
    add_column :cooks, :default_delivery_address, :string
  end
end
