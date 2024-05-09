# app/controllers/reservations_controller.rb
class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:edit, :update, :destroy]
  before_action :set_restaurant, only: [:new, :create]

  def index
    if current_user.customer?
      # Fetch the customer's reservations
      @reservations = current_user.reservations.order('reservation_time ASC')
    elsif current_user.restaurant_user?
      # Fetch the reservations associated with the restaurant the user manages
      restaurant = current_user.restaurant
      @reservations = restaurant.reservations.order('reservation_time ASC') if restaurant
    else
      @reservations = []
    end
  end


  def new
    @reservation = @restaurant.reservations.build
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      handle_table_status
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
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_time, :party_size, :status)
  end

  def handle_table_status
    if @reservation.status == 'confirmed' || @reservation.status == 'canceled'
      @reservation.table.update(status: 'available')
    elsif @reservation.status == 'accepted'
      @reservation.table.update(status: 'booked')
    end
  end

  def find_available_table(restaurant_id, party_size)
    Table.where(restaurant_id: restaurant_id, capacity: party_size..Float::INFINITY, status: 'available')
         .order(:capacity).first
  end


end
