# frozen_string_literal: true

class Cookbook < ApplicationRecord
  has_many :cookbook_recipes
  has_many :recipes, through: :cookbook_recipes

  validates :name, presence: true, uniqueness: true
end
