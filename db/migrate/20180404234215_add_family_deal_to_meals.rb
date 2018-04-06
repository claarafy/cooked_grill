class AddFamilyDealToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :family_deal, :boolean
  end
end
