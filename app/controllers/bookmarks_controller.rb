class BookmarksController < ApplicationController
  before_action :set_bookmarks, except: %i[index destroy]
  def index
    @searches = Search.where("rating>=7").limit(3)
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.search = @search
    if @bookmark.save
      redirect_to search_path(@search)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to search_path(@bookmark.search), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:website_name, :search_id)
  end

  def set_search
    @search = Search.find(params[:search_id])
  end

  def set_bookmarks
    @bookmark = Bookmark.find(params[:id])
  end
end
