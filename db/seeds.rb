# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'

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

list_details = [
  {
    name: 'Classics',
    image_url: 'https://cdn.cnn.com/cnnnext/dam/assets/190701104249-classic-movies-image-1-exlarge-169.jpg'
  },
  {
    name: 'Thriller',
    image_url: 'https://i1.wp.com/bestoftheyear.in/wp-content/uploads/2018/04/Hollywood-Suspense-thriller-movies.png?fit=753%2C459&ssl=1'
  },
  {
    name: 'Western',
    image_url: 'https://wallpapercave.com/wp/wp8804893.jpg'
  },
  {
    name: 'Science fiction',
    image_url: 'https://digitalsushma.com/wp-content/uploads/2021/02/Classic-Science-Fiction-Movies-You-Must-Watch.jpg'
  },
  {
    name: 'Comedy',
    image_url: 'https://wallpaperaccess.com/full/3726109.jpg'
  }
]

puts "Creating #{list_details.count} lists..."
list_details.each do |detail|
  list = List.new(name: detail[:name])
  file = URI.parse(detail[:image_url]).open
  list.image.attach(io: file, filename: "#{detail[:name]}.jpg", content_type: 'image/jpg')
  list.save!
end
puts "  Created #{List.count} lists"

puts 'Finished!'
