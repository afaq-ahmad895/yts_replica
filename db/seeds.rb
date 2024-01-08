# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Api.create!(
  title: "Top Gun",
  rating: 8.5,
  genres: "Drama",
  picture: "action.jpeg",
  release_date: "2023-01-01"
)

Api.create!(
  title: "spiderman",
  rating: 7.0,
  genres: "Comedy",
  picture: "adam.jpeg",
  release_date: "2023-02-15"
)

Api.create!(
  title: "Avatar",
  rating: 5.0,
  genres: "Comedy",
  picture: "avatar.jpeg",
  release_date: "2023-02-15"
)