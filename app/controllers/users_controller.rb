class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
    if @user.status == 'restaurant' && @user.restaurant.nil?
      redirect_to new_restaurant_path, alert: "Please create your restaurant profile."
    end
    if @user && @user.status == 'restaurant'
      @restaurant = @user.restaurant
    end  
  end

  def create
    @user = User.new(username: "...", password_digest: "...", status: "...")
  end

  def edit
    @user = current_user
    @restaurant = @user.build_restaurant unless @user.restaurant
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :status, restaurant_attributes: [:id, :name, :description, :food_type, :open_hour, :price_range, :image])
  end

end
