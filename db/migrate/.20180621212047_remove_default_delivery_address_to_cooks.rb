class RemoveDefaultDeliveryAddressToCooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :cooks, :defaultDeliveryAddress, :string
  end
end
