class CreateNewDeliveryAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :new_delivery_addresses do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
