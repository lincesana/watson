class ScamdocService
  require 'watir'
  require 'webdrivers'
  require 'faker'

  def initialize(input)
    @input = input
    @https = nil
    @scamdoc_rating = nil
  end

  def scamdoc_score
    browser = Watir::Browser.new
    browser.goto('https://www.scamdoc.com/')
    browser.text_field(id: 'search_input').set @input.to_s
    browser.button(id: 'search-load').click
    new_page = input.submit
    # puts new_page.uri
    value = new_page.search("#final_score").attribute('value').value.to_i
    @scamdoc_rating = value
  end

  def https_presence
  end
end
