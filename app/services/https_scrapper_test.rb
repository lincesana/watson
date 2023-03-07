require "open-uri"
require "mechanize"

mechanize = Mechanize.new
page = mechanize.get('https://www.scamdoc.com/')
input = page.forms[0]
# pp input
input['expression'] = 'curvadealta.com'
new_page = input.submit
# puts new_page.uri
https = new_page.search(".interrogation-list").inner_html.match?(/HTTPS/)
pp https
# puts "#{input['expression']} score in ScamDoc is: #{value}."
