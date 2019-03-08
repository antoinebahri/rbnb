class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @flats = Flat.all
  end

  def trips
    if current_user
      @my_trips = current_user.bookings
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def places
    if current_user
      # this is an array of all your places/flats
      @my_flats = current_user.flats
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def bookings
    if current_user
      # this is an array of all your reservations, as a host
      @all_my_bookings = []
      @my_bookings = []
      @my_flats = current_user.flats
      @my_flats.each do |flat|
        @all_my_bookings << flat.bookings
      end
      @all_my_bookings.each do |bookings|
        bookings.each do |booking|
          @my_bookings << booking
        end
      end
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
    raise
  end

  def status_accepted(booking)
    booking.status = "Accepted"
    redirect_to dashboard_bookings_path
  end

  def status_declined(booking)
    booking.status = "Declined"
    redirect_to dashboard_bookings_path
  end

end
