json.extract! meal, :id, :title, :ingredients, :availability_from, :availability_to, :images, :cost, :location, :tags, :meal_rating, :cook_id, :created_at, :updated_at
json.url meal_url(meal, format: :json)
