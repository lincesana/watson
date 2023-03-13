class WebsitesController < ApplicationController
  def index
    @websites = Website.all
  end

  def show
    @website = Website.find(params[:id])
  end

  def create
    @website = Website.all.find { |e| e.website_url == params["query"] }
    unless @website.present?
      @website = Search.new
      @website.website_url = params["query"]
      @website.save
    end
  end
end
