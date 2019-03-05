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
    @flat = Flat.new()
  end

  def update
  end

  def destroy
  end


end
