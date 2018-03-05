class AddCookTotalToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :cook_total, :decimal
  end
end
