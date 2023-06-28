# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require_relative "seeds/yema_cake"
require_relative "seeds/chicken_pho"

Rake::Task["db:reset"].invoke

Seeds::YemaCake.new.run
Seeds::ChickenPho.new.run