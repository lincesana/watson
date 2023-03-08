class SearchesController < ApplicationController
  def index
    @searches = Search.where("rating>5")
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:website_name, :website_url, :trustpilot_verification, :scandoc, :https, :rating)
  end
end
