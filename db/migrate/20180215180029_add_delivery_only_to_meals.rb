class AddDeliveryOnlyToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :delivery_only, :boolean
  end
end
