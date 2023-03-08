class TrustpilotService
  def initialize(company)
    @company = company
  end

  require "open-uri"
  require "nokogiri"

  def trustpilot
    url = "https://www.trustpilot.com/review/#{@company}"
    html_file = URI.open(url)
    return true if html_file.read
  rescue StandardError
    # if shopname exists on trustpilot, return true, if not, return nil.
  end
end
