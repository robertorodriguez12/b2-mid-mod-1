require "rails_helper"

RSpec.describe "Visitor", type: :feature do
  describe "Visit visitor index" do

    it "I can see names of all passengers and the number of flights they are in " do
      @airline = Airline.create(name: "United")
      @airline2 = Airline.create(name: "Frontier")
      @flight = @airline.flights.create(flight_number: "UA123")
      @flight2 = @airline2.flights.create(flight_number: "FA123")
      @passenger = Passenger.create(name: "John", age: 20)
      @passenger2 = Passenger.create(name: "Jane", age: 22)
      @flight.passengers << @passenger
      @flight.passengers << @passenger2
      @flight2.passengers << @passenger
      @flight2.passengers << @passenger2
      visit '/passengers'
      expect(page).to have_content(@passenger.name)
      expect(page).to have_content(@passenger2.name)
      within"#passenger-#{@passenger.id}" do
        expect(page).to have_content("Number of Flights: 2")
      end
    end

  end

end
