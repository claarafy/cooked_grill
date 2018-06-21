class AddDefaultDeliveryAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :default_delivery_address, :string
  end
end
