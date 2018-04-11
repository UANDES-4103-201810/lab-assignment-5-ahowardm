class PlacesController < ApplicationController
  def index
    @places = Place.all
    render json: @places
  end

  def show
    @place = Place.find params[:id]
    render json: @place
  end

  def create
    @place = Place.create place_params
    # redirect_to @ticket
    render json: @place
  end

  def update
    @place = Place.find params[:id]
    @place.update place_params
    render json: @place
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_path
  end

  private
  def place_params
    place_params = params.require(:ticket).permit(:name, :address, :capacity)
  end
end
