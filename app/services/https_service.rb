class HttpsService

  def initialize(company)
    @company = company
  end

  require "open-uri"
  require "nokogiri"

  def check_https_stores
   if @company.match?(/^(http|https):\/\//)
    @company.match?(/^https:\/\//)
   else
    if @company.match?(/^www./)
    url = "https://#{@company}"
    return true if  html_file = URI.open(url).read
    end
  end
      #if shopname starts with https, return true, if not, return nil.
  end
end
