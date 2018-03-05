class AddPickupOnlyToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :pickup_only, :boolean
  end
end
