class ScamdocService
  require "nokogiri"
  require "open-uri"
  require "mechanize"

  def initialize(search_input)
    @search_input = search_input
    @https = nil
    @scamdoc_rating = nil
  end

  def scamdoc_score
    mechanize = Mechanize.new
    # mechanize.user_agent = 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; de-at) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10'
    # mechanize.set_proxy('202.8.74.10', '8080')
    page = mechanize.get('https://www.scamdoc.com/')
    input = page.forms[0]
    # pp input
    input['expression'] = @search_input.to_s
    new_page = input.submit
    # puts new_page.uri
    value = new_page.search("#final_score").attribute('value').value.to_i
    @scamdoc_rating = value
  end

  def https_presence
    mechanize = Mechanize.new
    # mechanize.set_proxy('202.8.74.10', '8080')
    page = mechanize.get('https://www.scamdoc.com/')
    input = page.forms[0]
    # pp input
    input['expression'] = @search_input.to_s
    new_page = input.submit
    # puts new_page.uri
    https_check = new_page.search(".interrogation-list").inner_html.match?(/HTTPS/)
    @https = https_check
  end
end
