class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def index
    @search = Search.all
  end

  def show
    @search = search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:website_name, :website_url, :trustpilot_verification, :scandoc, :https, :rating)
  end
end
