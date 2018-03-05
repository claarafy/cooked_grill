class AddBalanceToCook < ActiveRecord::Migration[5.1]
  def change
    add_column :cooks, :balance, :decimal
  end
end
