class Search < ApplicationRecord
  belongs_to :website
  has_many :reviews, through: :website

  def website_url
    website.website_url
  end
end
