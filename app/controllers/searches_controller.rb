class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @searches = Search.where("rating>=7").limit(3)
  end

  def create
    query = clean_up_url(params["query"].downcase) if params["query"].present?
    @website = Website.find_by(website_url: query) || Website.create(website_url: query)
    @search = Search.where(website: @website)&.last

    unless @search.present? && @search.updated_at < 30.days.ago
      @search = Search.new
      @search.website = @website
      @search.trustpilot_verification = TrustpilotService.new(query).trustpilot.present?
      @search.scamdoc_score = ScamdocService.new(query).scamdoc_score
      @search.https = ScamdocService.new(query).https_presence
      if scamdoc_weight.nil?
        @search.rating = nil
      else
        @search.rating = scamdoc_weight + trustpilot_weight
      end
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

  def scamdoc_weight
    if @search.scamdoc_score.nil? || @search.scamdoc_score > 90
      @search.scamdoc_score
    else
      @search.scamdoc_score * 0.8
    end
  end

  def trustpilot_weight
    if @search.trustpilot_verification == true && @search.scamdoc_score <= 90
      @trustpilot_score = 20
    else
      @trustpilot_score = 0
    end
  end

  def clean_up_url(url)
    url.match?(/www./) ? url.gsub(/www./, "") : url
  end
end
