class AddDriverBalanceToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :driver_balance, :decimal
  end
end
