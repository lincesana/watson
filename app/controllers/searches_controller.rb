class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @searches = Search.where("rating>=7").limit(3)
  end

  def create
    @website = Website.find_by(website_url: params["query"])
    @search = Search.where(website: @website).last if @website

    unless @website && @search.present?
      @search = Search.new
      @website = Website.create(website_url: params["query"])
      @search.website = @website
      @search.trustpilot_verification = TrustpilotService.new(params["query"]).trustpilot.present?
      @search.scamdoc_score = ScamdocService.new(params["query"]).scamdoc_score
      @search.https = ScamdocService.new(params["query"]).https_presence
      @search.save
    end

    if @search.id
      redirect_to search_path(@search)
    else
      render 'index'
    end
  end

  def show
    @search = Search.find(params[:id])
    @review = Review.new(website: @website)
  end

  private

  def search_params
    params.require(:search).permit(:website_name, :website_url, :trustpilot_verification, :scandoc, :https, :rating)
  end
end
