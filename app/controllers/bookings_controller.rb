class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    check_for_auth
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:flat_id])
  end

  def edit
    raise
    check_for_auth
    @booking = Booking.find(params[:flat_id])
  end

  def create
    check_for_auth
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
    check_for_auth
    @booking = Booking.find(params[:flat_id])
    if @booking.update(params)
      redirect_to flat_booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    check_for_auth
    @booking = Booking.find(params[:flat_id])
    @booking.destroy
    redirect_to root_path
  end

  def approve
    booking = Booking.find(params[:id])
    booking.status = "Accepted"
    booking.save
    redirect_to dashboard_bookings_path
  end

  def decline
    booking = Booking.find(params[:id])
    booking.status = "Declined"
    booking.save
    redirect_to dashboard_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def check_for_auth
    unless current_user
      redirect_to new_user_session_path
    end
  end
end
