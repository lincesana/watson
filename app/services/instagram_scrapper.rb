require "mechanize"

mechanize = Mechanize.new
page = mechanize.get('https://www.castill.sk/')

next_page = page.links_with(:href => /https:\/\/www.instagram.com\//).first.href

pp next_page
