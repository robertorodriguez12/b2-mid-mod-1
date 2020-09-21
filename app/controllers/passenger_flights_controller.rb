class PassengerFlightsController < ApplicationController

  def destroy
    PassengerFlight.remove_passenger(params[:flight_id], params[:id])
    redirect_to '/flights'
  end

end
