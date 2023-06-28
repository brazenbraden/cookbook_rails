module Seeds
  class ChickenPho
    def run
      cookbook = create_cookbook
      recipe = create_recipe(cookbook)

      create_steps(recipe)
      create_ingredients(recipe)
      puts "Seeds::ChickenPho seeded"
    end

    private

    def create_cookbook
      Cookbook.create!(
        name: "Vietnamese",
        description: "Only the best vietnamese recipes"
      )
    end

    def create_recipe(cookbook)
      recipe = Recipe.create!(
        name: "Chicken Pho",
        blurb: "A hearty chicken broth soup with rice noodles, a staple in Vietnam.",
        duration: 2 * 60 * 60
      )
      CookbookRecipe.create!(cookbook: cookbook, recipe: recipe)
      recipe
    end

    def create_steps(recipe)
      [
        {
          position: 1,
          description: "Make the bone broth"
        },
        {
          position: 2,
          description: "Boil the rice noodles for 5 minutes until soft but still with a bite"
        },
        {
          position: 3,
          description: "Add the noodles to the bowl"
        },
        {
          position: 4,
          description: "Top your noodles with your chicken pieces, bean sprouts, mint and corriander"
        },
        {
          position: 5,
          description: "Ladle over the broth and serve"
        }
      ].each { |step| RecipeStep.create!(step.merge(recipe: recipe)) }
    end

    def create_ingredients(recipe)
      [
        {
          name: "Rice Noodles",
          calories: 10,
          price: 2.5,
          available: 1000,
          unit: "g",
          ingredient_type: IngredientType.where(name: "Dry").first_or_create
        },
        {
          name: "Chicken",
          calories: 100,
          price: 1.3,
          available: 2000,
          unit: "g",
          ingredient_type: IngredientType.where(name: "Meat").first_or_create
        },
        {
          name: "Bean Sprouts",
          calories: 50,
          price: 5.35,
          available: 8,
          unit: "g",
          ingredient_type: IngredientType.where(name: "Fresh Produce").first_or_create
        },
        {
          name: "Corriander",
          calories: 80,
          price: 4.5,
          available: 350,
          unit: "g",
          ingredient_type: IngredientType.where(name: "Fresh Produce").first_or_create
        },
        {
          name: "Mint",
          calories: 50,
          price: 3.80,
          available: 400,
          unit: "g",
          ingredient_type: IngredientType.where(name: "Fresh Produce").first_or_create
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