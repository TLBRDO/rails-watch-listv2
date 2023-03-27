# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'

puts 'Deleting all the movies...'
Movie.destroy_all


url = "https://tmdb.lewagon.com/movie/top_rated"

puts 'Importing movies...'
movies = JSON.parse(URI.open(url).read)["results"].take(10)
movies.each do |movie|
  puts "Creating the movie : #{movie['title']}"
  base_poster_url = "https://image.tmdb.org/t/p/original"
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "#{base_poster_url}#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
