class AddLowCarbToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :low_carb, :boolean
  end
end
