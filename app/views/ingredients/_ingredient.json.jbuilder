json.extract! ingredient, :id, :name, :quantity, :calories, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
