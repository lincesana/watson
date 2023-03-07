class ScandocService
  require "nokogiri"
  require "open-uri"
  require "mechanize"

  def initialize(company)
    @company = company
  end

  def search
    mechanize = Mechanize.new
    page = mechanize.get('https://www.merriam-webster.com/word-of-the-day')
    input = page.forms[0]
    input['s'] = 'awesome'
    new_page = input.submit
        word_searched = new_page.search('h1.hword')
    puts new_page.uri
    puts "You successfully searched for the word #{word_searched.text.strip.upcase}."
  end

  search
end
