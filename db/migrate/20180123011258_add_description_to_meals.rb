class AddDescriptionToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :description, :text
  end
end
