class ReviewsController < ApplicationController
  def create
    @search = Search.find(params[:search_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.website = @search.website
    if @review.save
      redirect_to search_path(@search)
    else
      redirect_to search_path(@search), status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @search = Search.find(params[:search_id])
    redirect_to search_path(@search)
  end

  def review_params
    params.require(:review).permit(:comment)
  end
end
