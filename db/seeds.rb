# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Cleaning database..."

BookmarkCategory.destroy_all
UserCategory.destroy_all
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

puts "Creating websites..."

website1 = {
  website_url: "www.veja-stores.com",
  trustpilot_verification: false,
  scamdoc_score: 1,
  https: true,
  rating: 10
}

website2 = {
  website_url: "www.ikea.es",
  trustpilot_verification: true,
  scamdoc_score: 80,
  https: true,
  rating: 88
}

website3 = {
  website_url: "www.notenom.com",
  trustpilot_verification: true,
  scamdoc_score: 13,
  https: true,
  rating: 56
}

website4 = {
  website_url: "www.gardentm.com",
  trustpilot_verification: true,
  scamdoc_score: 56,
  https: true,
  rating: 74
}

website5 = {
  website_url: "www.amazon.com",
  trustpilot_verification: true,
  scamdoc_score: 99,
  https: true,
  rating: 92
}

website6 = {
  website_url: "es.aliexpress.com",
  trustpilot_verification: true,
  scamdoc_score: 77,
  https: true,
  rating: 85 }

[website1, website2, website3, website4, website5, website6].each do |attributes|
  website = Website.create!(website_url: attributes[:website_url])
  search = Search.create!(website_id: website.id, trustpilot_verification: attributes[:trustpilot_verification], scamdoc_score: attributes[:scamdoc_score], https: attributes[:https], rating: attributes[:rating])
    bookmark = Bookmark.create(search_id: search.id, user_id: User.ids.sample)
    puts "Created #{bookmark}"
  puts "Created #{website.website_url}"
end
puts "Finished!"
puts "Creating websites..."
