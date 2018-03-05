class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.text :title
      t.text :ingredients
      t.datetime :availibility_from
      t.datetime :availability_to
      t.string :images
      t.decimal :cost
      t.string :location
      t.string :tags
      t.integer :meal_rating
      t.references :cook, foreign_key: true
      t.timestamps
    end
  end
end
