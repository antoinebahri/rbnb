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
    @flat = Flat.find(params[:id])
  end

  def create
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
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to root_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :address, :city, :price_night, :description, :picture, :latitude, :longitude)
  end
end
