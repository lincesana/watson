class SearchesController < ApplicationController
  def index
    @searches = Search.where("rating>=7").limit(3)
  end

  def create
    @search = Search.all.find{|e| e.website_url == params["query"]}
    unless @search.present?

      @search = Search.new
      @search.website_url = params["query"]
      @search.trustpilot_verification = TrustpilotService.new(params["query"]).trustpilot.present?
      @search.scandoc = ScamdocService.new(params["query"]).scamdoc_score
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
  end

  private

  def search_params
    params.require(:search).permit(:website_name, :website_url, :trustpilot_verification, :scandoc, :https, :rating)
  end
end
