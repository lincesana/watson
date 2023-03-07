# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Cleaning database..."
Bookmark.destroy_all
Search.destroy_all
User.destroy_all

puts "Creating users..."
user1 = { username: "AryaStark", password: "123456" }
user2 = { username: "JonSnow", password: "123456" }
user3 = { username: "JaimeLannister", password: "123456" }
user4 = { username: "SansaStark", password: "123456" }
user5 = { username: "Daenerys", password: "123456" }
user6 = { username: "JoffreyBaratheon", password: "123456" }

[user1, user2, user3, user4, user5, user6].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.username}"
end
puts "Finished!"

puts "Creating searches..."

amazon = {
  website_name: "Amazon",
  website_url: "www.amazon.es",
  trustpilot_verification: true,
  scandoc: 99,
  https: true,
  rating: 9,
  user_id: 1
}

aliexpress = {
  website_name: "Ali Express",
  website_url: "es.aliexpress.com",
  trustpilot_verification: true,
  scandoc: 77,
  https: true,
  rating: 6,
  user_id: 2
}

ebay = {
  website_name: "Ebay",
  website_url: "www.ebay.es",
  trustpilot_verification: true,
  scandoc: 84,
  https: true,
  rating: 7,
  user_id: 3
}

fnac = {
  website_name: "Fnac",
  website_url: "www.fnac.es",
  trustpilot_verification: true,
  scandoc: 56,
  https: true,
  rating: 7,
  user_id: 4
}
mim = {
  website_name: "mim",
  website_url: "www.mimshoes.com",
  trustpilot_verification: false,
  scandoc: 45,
  https: true,
  rating: 6,
  user_id: 5
}
ganzitos = {
  website_name: "Ganzitos Shoes",
  website_url: "ganzitos.com",
  trustpilot_verification: true,
  scandoc: 13,
  https: true,
  rating: 5,
  user_id: 6
}
veja = {
  website_name: "Veja Espana",
  website_url: "www.vejaespana.co",
  trustpilot_verification: false,
  scandoc: 1,
  https: true,
  rating: 1,
  user_id: 1
}
eusale = {
  website_name: "Eusale Coat",
  website_url: "Eusalecoat.com",
  trustpilot_verification: false,
  scandoc: 1,
  https: true,
  rating: 1,
  user_id: 1
}

yowtaero = {
  website_name: "Yowtaero",
  website_url: "www.yowtaero.com",
  trustpilot_verification: false,
  scandoc: 1,
  https: true,
  rating: 1,
  user_id: 2
}
ikea = {
  website_name: "IKEA Espana",
  website_url: "www.ikea.es",
  trustpilot_verification: true,
  scandoc: 80,
  https: true,
  rating: 8,
  user_id: 3
}

puts "Creating bookmarks..."
