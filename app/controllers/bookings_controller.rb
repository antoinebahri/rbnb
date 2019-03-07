class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:flat_id])
  end

  def edit
    @booking = Booking.find(params[:flat_id])
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to flat_booking_path(@flat, @booking)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:flat_id])
    if @booking.update(params)
      redirect_to flat_booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:flat_id])
    @booking.destroy
    redirect_to root_path
  end

  private

def booking_params
    params.require(:booking).permit(:start_date, :end_date)
end
end

