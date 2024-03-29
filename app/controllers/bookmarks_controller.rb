class BookmarksController < ApplicationController
  before_action :set_bookmarks, except: %i[index create destroy]
  before_action :set_search, only: %i[create]

  def index
    @bookmarks = Bookmark.where(user: current_user)

    @bookmarks = @bookmarks.select { |p| p.categories.ids.include?(params[:category].to_i) } if params[:category].present?
    respond_to do |format|
      format.html
      format.text { render partial: "bookmarks", locals: {bookmarks: @bookmarks }, formats: [:html] }
    end
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.search = @search
    if @bookmark.save
      redirect_to bookmarks_path
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
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:search_id)
  end

  def set_search
    @search = Search.find(params[:search_id])
  end

  def set_bookmarks
    @bookmark = Bookmark.find(params[:id])
  end
end
