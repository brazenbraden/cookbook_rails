# frozen_string_literal: true

class CookbookRecipe < ApplicationRecord
  belongs_to :cookbook
  belongs_to :recipe
end
