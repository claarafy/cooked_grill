class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.decimal :total
      t.text :pickup_address
      t.text :delivery_address
      t.datetime :order_date
      t.datetime :pickup_date
      t.string :customer_phone
      t.references :user, foreign_key: true
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
