class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    calculate_total_price
  end

  def new
    @bicycle = find_bicycle
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bicycle = find_bicycle
    @booking.user = current_user
    if @booking.save
      redirect_to bicycle_booking_path(@booking.bicycle, @booking)
    else
      render :new
    end
  end

  def edit
    @bicycle = find_bicycle
  end

  def update
    @booking.update(booking_params)
    redirect_to bicycle_booking_path(@booking.bicycle, @booking)
  end

  def destroy
    @booking.destroy
    redirect_to bicycle_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :user_id, :bicycle_id)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_bicycle
    Bicycle.find(params[:bicycle_id])
  end

  def calculate_total_price
    @price = @booking.bicycle.price * ((@booking.date_end - @booking.date_start) * 0.000277778).floor
  end
end
