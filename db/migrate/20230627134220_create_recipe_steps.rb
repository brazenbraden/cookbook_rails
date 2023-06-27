class CreateRecipeSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_steps do |t|
      t.references :recipe, null: false, foreign_key: true
      t.text :description, null: false
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
