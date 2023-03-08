# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Cleaning database..."

User.destroy_all
Search.destroy_all
Bookmark.destroy_all

puts "Creating users..."
user1 = { username: "AryaStark", email: "123@mail.com", password: "123456" }
user2 = { username: "JonSnow", email: "456@mail.com", password: "123456" }
user3 = { username: "JaimeLannister", email: "789@mail.com", password: "123456" }
user4 = { username: "SansaStark", email: "987@mail.com", password: "123456" }
user5 = { username: "Daenerys", email: "654@mail.com", password: "123456" }
user6 = { username: "JoffreyBaratheon", email: "321@mail.com", password: "123456" }

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
  rating: 9
}

aliexpress = {
  website_name: "Ali Express",
  website_url: "es.aliexpress.com",
  trustpilot_verification: true,
  scandoc: 77,
  https: true,
  rating: 6
}

ebay = {
  website_name: "Ebay",
  website_url: "www.ebay.es",
  trustpilot_verification: true,
  scandoc: 84,
  https: true,
  rating: 7
}

fnac = {
  website_name: "Fnac",
  website_url: "www.fnac.es",
  trustpilot_verification: true,
  scandoc: 56,
  https: true,
  rating: 7
}
mim = {
  website_name: "mim",
  website_url: "mimshoes.com",
  trustpilot_verification: false,
  scandoc: 45,
  https: true,
  rating: 6
}
ganzitos = {
  website_name: "Ganzitos Shoes",
  website_url: "ganzitos.com",
  trustpilot_verification: true,
  scandoc: 13,
  https: true,
  rating: 5
}
veja = {
  website_name: "Veja Espana",
  website_url: "www.vejaespana.co",
  trustpilot_verification: false,
  scandoc: 1,
  https: true,
  rating: 1
}
eusale = {
  website_name: "Eusale Coat",
  website_url: "Eusalecoat.com",
  trustpilot_verification: false,
  scandoc: 1,
  https: true,
  rating: 1
}

yowtaero = {
  website_name: "Yowtaero",
  website_url: "www.yowtaero.com",
  trustpilot_verification: false,
  scandoc: 1,
  https: true,
  rating: 1

}
ikea = {
  website_name: "IKEA Espana",
  website_url: "www.ikea.es",
  trustpilot_verification: true,
  scandoc: 80,
  https: true,
  rating: 8

}

[amazon, aliexpress, ebay, fnac, mim, ganzitos, veja, eusale, yowtaero, ikea].each do |attributes|
  search = Search.create!(attributes)
  bookmark = Bookmark.create(search_id: search.id, user_id: User.ids.sample)
  puts "Created #{search.website_name}"
  puts "Created #{bookmark}"
end
puts "Finished!"

puts "Creating bookmarks..."
