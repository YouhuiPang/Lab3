class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    @review.user = current_user  # Assuming you have some authentication setup

    if @review.save
      redirect_to @restaurant, notice: 'Review was successfully created.'
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@restaurant), notice: 'Review deleted successfully.'
  end

  private

  def review_params
    params.require(:review).permit(:comment, :stars)  
  end
end
