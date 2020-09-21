require "rails_helper"

RSpec.describe "Flights", type: :TYPE do
  describe "As a visitor" do
    before(:each) do
      @airline = Airline.create(name: "United")
      @airline2 = Airline.create(name: "Frontier")
      @flight = @airline.flights.create(flight_number: "UA123")
      @flight2 = @airline2.flights.create(flight_number: "FA123")
      @flight.passengers << Passenger.create(name: "John", age: 20)
      @flight.passengers << Passenger.create(name: "Jane", age: 22)
      @flight2.passengers << Passenger.create(name: "Mark", age: 21)
      @flight2.passengers << Passenger.create(name: "Felicia", age: 23)
    end
    it "can see a list of all flights and it's passengers" do
      visit '/flights'

      expect(page).to have_content(@flight.flight_number)
      expect(page).to have_content(@flight2.flight_number)

    end

  end
#   User Story 1, Flights Index Page
# As a visitor
# When I visit the flights index page ('/flights')
# I see a list of all flight numbers
# And under each flight number I see the names of all that flights passengers
end
