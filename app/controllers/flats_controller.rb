class FlatsController < ApplicationController
  def new
    @flat = Flat.new
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def update
    if @flat.update(restaurant_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :city, :price_night, :description, :picture)
  end
end
