class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :blurb, default: ""
      t.integer :duration, default: 0

      t.timestamps
    end
  end
end
