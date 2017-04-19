# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create([{ name: 'Spa' }, { name: 'Romantic Dinner' }, { name: 'Rock Climbing' }, { name: 'Dinner Cruise' }, { name: 'Shopping Excursion' }, { name: 'Night at the Museum' }, { name: 'Cupcake Night' }])

# Category.create()

# reviews = [
#   { rating: 1,
#     comment: "A great experience"
#   },
#   {
#     rating: 4,
#     comment: "Highly recommend"
#   },
#   {
#     rating: 5,
#     comment: "A new favorite"
#   }
# ]

# reviews.each do |review|
  Review.create({ rating: 1, comment: "A great Experience" })
# end
