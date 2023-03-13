require 'watir'
require 'webdrivers'
require 'faker'
require 'headless'


browser = Watir::Browser.new
browser.goto('https://www.scamdoc.com/')
browser.text_field(id: 'search_input').set 'f1.com'
browser.button(id: 'search-load').click
puts browser.input(id: 'final_score').value
