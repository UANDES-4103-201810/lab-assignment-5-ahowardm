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

  def places_with_most_assistance
    @places
  end

  #def top_ten_clients
  #  @users_tickets = UserTicket.group(:user).count.sort_by {|key, value| value }.reverse!.first(10)
  #  render json: @users_tickets
  #end

  private
  def place_params
    place_params = params.require(:place).permit(:name, :address, :capacity)
  end
end
