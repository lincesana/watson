class ScamdocService
  require "nokogiri"
  require "open-uri"
  require "mechanize"

  def initialize(company)
    @company = company
  end

  def scamdoc_score
    mechanize = Mechanize.new
    page = mechanize.get('https://www.scamdoc.com/')
    input = page.forms[0]
    # pp input
    input['expression'] = @company.to_s
    new_page = input.submit
    # puts new_page.uri
    value = new_page.search("#final_score").attribute('value').value
    https = new_page.search(".interrogation-list").inner_html.match?(/HTTPS/)
    puts "#{input['expression']} score in ScamDoc is: #{value}."
    puts "HTTPS presence in this website: #{https}."
  end
end
