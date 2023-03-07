class TrustpilotService

  def initialize(company)
    @company = company
  end

  require "open-uri"
  require "nokogiri"

  def check_trustpilot_stores
    url = "https://www.trustpilot.com/review/#{@company}"
    return true if  html_file = URI.open(url).read
    rescue StandardError
      #if shopname exists on trustpilot, return true, if not, return nil.
  end
end