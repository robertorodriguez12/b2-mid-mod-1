class Flight < ApplicationRecord
  validates_presence_of :flight_number
  belongs_to :airline

  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights
end
