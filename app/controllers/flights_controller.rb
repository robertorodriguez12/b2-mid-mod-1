class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def remove_passenger
    PassengerFlight.where(passenger_id: params[:id]).destroy_all
    Passenger.destroy(params[:id])
    redirect_to '/flights'
  end

end
