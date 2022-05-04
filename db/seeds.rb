# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
base_url = 'https://api.themoviedb.org/'
img_base_url = 'https://image.tmdb.org/t/p/'
img_size = 'w500' # original

connection = Faraday.new(
  url: base_url,
  params: { api_key: ENV.fetch('TMDB_API_KEY') },
  headers: { 'Content-Type' => 'application/json' }
)

puts 'Cleaning database...'
Movie.destroy_all
List.destroy_all

response = connection.get('/3/movie/top_rated')
data = JSON.parse(response.body)

movies = data['results']

puts "Creating #{movies.count} movies..."
movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: img_base_url + img_size + movie['poster_path'],
    rating: movie['vote_average']
  )
end
puts "  Created #{Movie.count} movies"

list_names = ['Classics', 'Thriller', 'Western', 'Science fiction', 'Comedy']

puts "Creating #{list_names.count} lists..."
list_names.each { |list_name| List.create!(name: list_name) }
puts "  Created #{List.count} lists"

puts 'Finished!'
