class Search < ApplicationRecord
  belongs_to :website

  def website_url
    website.website_url
  end
end
