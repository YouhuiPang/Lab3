# app/controllers/reservations_controller.rb
class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:edit, :update, :destroy]
  before_action :set_restaurant, only: [:new, :create, :show]

  def index
    @reservations = current_user.reservations.order("reservation_time DESC")
  end

  def new
    @reservation = @restaurant.reservations.build
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to my_reservations_path, notice: 'Reservation was successfully updated.'
    else
      render :edit
    end
  end


  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user
    @reservation.table = find_available_table(@restaurant.id, @reservation.party_size)

    if @reservation.table
      @reservation.table.update(status: 'booked')
      if @reservation.save
        redirect_to restaurant_path(@restaurant), notice: 'Reservation successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    else
      flash[:alert] = 'No available tables for the selected size.'
      render :new
    end
  end

  def destroy
    if @reservation.destroy
      @reservation.table.update(status: 'available')  # Revert table status to available
      redirect_to my_reservations_path, notice: 'Reservation deleted successfully.'
    else
      redirect_to my_reservations_path, alert: 'Failed to delete reservation.'
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_reservation
    @reservation = current_user.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_time, :party_size)
  end

  def find_available_table(restaurant_id, party_size)
    Table.where(restaurant_id: restaurant_id, capacity: party_size..Float::INFINITY, status: 'available')
         .order(:capacity).first
  end

end
