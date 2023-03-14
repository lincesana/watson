class BookmarkCategoriesController < ApplicationController
  before_action :set_bookmark_categories, only: :destroy
  before_action :set_user_categories, only: %i[new create]

  def new
    @bookmark_category = BookmarkCategory.new
  end

  def create
    @bookmark_category = BookmarkCategory.new
    @bookmark = Bookmark.find(params[:bookmark_id])
    @bookmark_category.user_category = @user_category
    @bookmark_category.bookmark = @bookmark
    if @bookmark_category.save
      redirect_to bookmarks_path
    else
      redirect_to bookmarks_path, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark_category.destroy
    redirect_to user_category_path(@bookmark_category.user_category), status: :see_other
  end

  private

  def bookmark_category_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark_categories
    @bookmark = BookmarkCategory.find(params[:id])
  end

  def set_user_categories
    @user_category = UserCategory.find(params[:user_category_id])
  end
end
