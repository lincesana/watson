require "open-uri"
require "mechanize"

mechanize = Mechanize.new
page = mechanize.get('https://www.scamdoc.com/')
input = page.forms[0]
# pp input
input['expression'] = 'veja.com'
new_page = input.submit
# puts new_page.uri
value = new_page.search("#final_score").attribute('value').value
puts "#{input['expression']} score in ScamDoc is: #{value}."
