# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts 'Creating movies...'
movie1 = Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
movie2 = Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
movie3 = Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
movie4 = Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
puts 'Creating list...'
file1 = URI.open("https://res.cloudinary.com/dbglim49p/image/upload/v1677247608/dwayne-johnson-roadblock-film-cinema-movie-man-flame-fire-sp_aue9cg.jpg")
file2 = URI.open("https://res.cloudinary.com/dbglim49p/image/upload/v1677247608/thumb-1920-601827_uvv0dl.jpg")
list1 = List.new(name: 'Action')
list1.photo.attach(io: file1, filename: "dwayne.png", content_type: "image/png")
list1.save
list2 = List.new(name: 'Fantastic')
list2.photo.attach(io: file2, filename: "fourfantastic.png", content_type: "image/png")

puts 'Create Bookmarks'
Bookmark.create(movie: movie1, list: list1, comment: 'ceci est un commentaire')
Bookmark.create(movie: movie2, list: list2, comment: 'ceci est un commentaire')
Bookmark.create(movie: movie3, list: list2, comment: 'ceci est un commentaire')
Bookmark.create(movie: movie4, list: list1, comment: 'ceci est un commentaire') # Mettre id de movies et id de list

puts 'Finished!'
