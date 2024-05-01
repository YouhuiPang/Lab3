class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews.includes(:user)
  end

  def search
    @date = params[:date]
    @time = params[:time]
    @party_size = params[:party_size]
    @query = params[:query]

    @restaurants = Restaurant.search(@query, @date, @time, @party_size)

    render :search
  end
end
