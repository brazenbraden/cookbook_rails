module Seeds
  class YemaCake
    def run
      cookbook = create_cookbook
      recipe = create_recipe(cookbook)

      create_steps(recipe)
      create_ingredients(recipe)
      puts "Seeds::YemaCake seeded"
    end

    private

    def create_cookbook
      Cookbook.create!(
        name: "Baking",
        description: "My collection of favourite and popular cakes and bakes."
      )
    end

    def create_recipe(cookbook)
      recipe = Recipe.create!(
        name: "Yema cake",
        blurb: "Filipino cake yum yum",
        duration: 2 * 60 * 60
      )
      CookbookRecipe.create!(cookbook: cookbook, recipe: recipe)
      recipe
    end

    def create_steps(recipe)
      [
        {
          position: 1,
          description: "Make the batter"
        },
        {
          position: 2,
          description: "Bake it in the oven for 40 minutes at 200 degrees celcius"
        },
        {
          position: 3,
          description: "Create the yema topping"
        },
        {
          position: 4,
          description: "Add the yema topping to the cooled sponges once baked"
        },
        {
          position: 5,
          description: "Top with grated cheddar and serve"
        }
      ].each { |step| RecipeStep.create!(step.merge(recipe: recipe)) }
    end

    def create_ingredients(recipe)
      [
        {
          name: "Flour",
          calories: 10,
          price: 2.5,
          available: 1000,
          unit: "g",
          ingredient_type: IngredientType.where(name: "Dry").first_or_create
        },
        {
          name: "Sugar",
          calories: 100,
          price: 1.3,
          available: 2000,
          unit: "g",
          ingredient_type: IngredientType.where(name: "Dry").first_or_create
        },
        {
          name: "Eggs",
          calories: 50,
          price: 5.35,
          available: 8,
          unit: "g",
          ingredient_type: IngredientType.where(name: "Eggs or Dairy").first_or_create
        },
        {
          name: "Cream Cheese",
          calories: 80,
          price: 4.5,
          available: 350,
          unit: "g",
          ingredient_type: IngredientType.where(name: "Eggs or Dairy").first_or_create
        },
        {
          name: "Cheddar Cheese",
          calories: 50,
          price: 3.80,
          available: 400,
          unit: "g",
          ingredient_type: IngredientType.where(name: "Eggs or Dairy").first_or_create
        }
      ].each do |item|
          ingredient = Ingredient.create!(item)
          RecipeIngredient.create!(
            recipe: recipe,
            ingredient: ingredient,
            quantity: (ingredient.available / 3)
          )
        end
    end
  end
end