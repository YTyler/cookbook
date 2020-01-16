# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# recipe_list = [
#   [ "Oak", "Quercus" ],
#   [ "Pine", "Pinus" ],
#   [ "Sycamore", "Platanus" ],
#   [ "Alder", "Alnus" ],
#   [ "Birch", "Betula"],
#   [ "Cherry", "Prunus"]
# ]
#
# recipe_list.each do |name, category|
#   Recipe.create( name: name, category: category )
# end

Recipe.destroy_all

15.times do |index|
  Recipe.create!(name: Faker::Food.dish, category: Faker::Beer.style, rank: Faker::Number.between(from: 1, to: 10), instructions: Faker::Food.description)
end

p "Created #{Recipe.count} recipes"

Ingredient.destroy_all

30.times do |index|
  Ingredient.create!(name: Faker::Food.ingredient, amount: Faker::Food.measurement)
end

p "Created #{Ingredient.count} ingredients"
