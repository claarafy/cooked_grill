class RemoveCostFromMeal < ActiveRecord::Migration[5.1]
  def change
    remove_column :meals, :cost, :decimal
  end
end
