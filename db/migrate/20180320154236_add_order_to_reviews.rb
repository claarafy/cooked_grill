class AddOrderToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :order, foreign_key: true
  end
end
