class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.references :ingredient_type, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :available, null: false, default: 0.0
      t.integer :calories, default: 0
      t.decimal :price, null: false, default: 0.0
      t.string :unit, default: "g"

      t.timestamps
    end
  end
end
