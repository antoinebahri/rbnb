class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @user = current_user
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id_flat])
  end

  def edit
    @booking = Booking.find(params[:id_flat])
  end

  def create
    @booking = Booking.new(params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id_flat])
    if @booking.update(params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id_flat])
    @booking.destroy
    redirect_to root_path
  end
end
