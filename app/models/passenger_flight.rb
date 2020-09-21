class PassengerFlight < ApplicationRecord
  validates_presence_of :passenger_id, :flight_id

  belongs_to :flight
  belongs_to :passenger

  def self.remove_passenger(flight, passenger)
    where(flight_id: flight).find_by(passenger_id: passenger).destroy
  end

end
