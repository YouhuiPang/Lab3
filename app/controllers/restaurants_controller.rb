class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end


  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews.includes(:user)
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user  # Assumes Devise or similar for user session

    if @restaurant.save
      redirect_to profile_path, notice: 'Restaurant profile created successfully.'
    else
      render :new
    end
  end


  def search
    @date = params[:date]
    @time = params[:time]
    @party_size = params[:party_size]
    @query = params[:query]

    @restaurants = Restaurant.search(@query, @date, @time, @party_size)

    render :search
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :food_type, :open_hour, :price_range)
  end

end
