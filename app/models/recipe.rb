# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :cookbook_recipes
  has_many :cookbooks, through: :cookbook_recipes

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  has_many :recipe_steps

  validates :name, presence: true, uniqueness: true
end
