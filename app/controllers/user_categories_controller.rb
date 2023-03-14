class UserCategoriesController < ApplicationController
  def new
    @user_category = UserCategory.new(user: current_user)
  end

  def create
    @user_category = UserCategory.new(category_params)
    @user_category.user = current_user
    if @user_category.save
      redirect_to bookmarks_path
    else
      render 'new'
    end
  end

  def destroy
    @user_category = UserCategory.find(params[:id])
    @user_category.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def category_params
    params.require(:user_category).permit(:name)
  end
end
