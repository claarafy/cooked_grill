class AddMealCostToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :meal_cost, :decimal, :precision => 8, :scale => 2
  end
end
