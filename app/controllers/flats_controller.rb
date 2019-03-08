class FlatsController < ApplicationController
  def index
    if params[:query].present?
      @flats = Flat.where.not(latitude: nil, longitude: nil).where("city ILIKE ?", params[:query])

      @markers = @flats.map do |flat|
        {
          lng: flat.longitude,
          lat: flat.latitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { flat: flat })
        }
      end
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
    check_for_auth
  end

  def show
    @flats = Flat.where.not(latitude: nil, longitude: nil)
    @flat = @flats.find(params[:id])
    @markers =
      [{
        lng: @flat.longitude,
        lat: @flat.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { flat: @flat })
      }]
  end

  def edit
    check_for_auth
    @flat = Flat.find(params[:id])
  end

  def create
    check_for_auth
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    check_for_auth
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to root_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :address, :city, :price_night, :description, :picture, :latitude, :longitude)
  end

  def check_for_auth
    unless current_user
      redirect_to new_user_session_path
    end
  end
end
