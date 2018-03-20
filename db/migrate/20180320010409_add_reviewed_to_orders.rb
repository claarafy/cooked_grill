class AddReviewedToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :reviewed, :boolean
  end
end
