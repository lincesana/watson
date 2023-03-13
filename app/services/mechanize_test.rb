require "nokogiri"
require "open-uri"
require "mechanize"

@search_input = 'f1.com'

mechanize = Mechanize.new
page = mechanize.get('https://www.digicert.com/help/')
input = page.forms[0]
pp input
# input = page.search("host")
# input = @search_input.to_s
# puts input
# new_page = input.button.click
# https_check = new_page.search(".error").inner_html.match?(/Unable to connect/)
# puts https_check
# @https = https_check
# puts @https
