class AddPortionInfoToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :portion_info, :text
  end
end
