class AddReviewRefToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :review, foreign_key: true
  end
end
