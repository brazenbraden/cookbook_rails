class CreateCookbookRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :cookbook_recipes do |t|
      t.references :cookbook, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
