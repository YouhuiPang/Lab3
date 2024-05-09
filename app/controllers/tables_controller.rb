# app/controllers/tables_controller.rb
class TablesController < ApplicationController
  before_action :set_restaurant
  before_action :set_table, only: [:edit, :update, :destroy]

  def new
    @table = @restaurant.tables.build
  end

  def create
    @table = @restaurant.tables.build(table_params)
    if @table.save
      redirect_to restaurant_tables_path(@restaurant), notice: 'Table successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @table.update(table_params)
      redirect_to restaurant_tables_path(@restaurant), notice: 'Table successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @table.destroy
    redirect_to restaurant_tables_path(@restaurant), notice: 'Table successfully deleted.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_table
    @table = @restaurant.tables.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:capacity, :status)
  end
end
