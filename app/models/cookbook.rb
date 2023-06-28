# frozen_string_literal: true

class Cookbook < ApplicationRecord
  has_many :cookbook_recipes
  has_many :recipes, through: :cookbook_recipes

  after_create_commit { broadcast_prepend_to "cookbooks" }
  after_update_commit { broadcast_replace_to "cookbooks" }
  after_destroy_commit { broadcast_remove_to "cookbooks" }

  validates :name, presence: true, uniqueness: true
end
