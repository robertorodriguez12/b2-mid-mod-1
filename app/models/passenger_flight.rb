class PassengerFlight < ApplicationRecord
  validates_presence_of :passenger_id, :flight_id

  belongs_to :flight
  belongs_to :passenger

end
