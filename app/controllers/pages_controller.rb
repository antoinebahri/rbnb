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
      @my_flats = current_user.flat
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def bookings
    if current_user
      @my_bookings = current_user.flat.booking
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end
end
