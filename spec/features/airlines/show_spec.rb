require "rails_helper"

RSpec.describe "Airlines", type: :feature do
  describe "When I visit an Airline show page" do
    before :each do
      @airline = Airline.create(name: "United")
      @flight = @airline.flights.create(flight_number: "UA123")
      @flight2 = @airline.flights.create(flight_number: "UA234")
      @flight.passengers << Passenger.create(name: "John", age: 20)
      @flight.passengers << Passenger.create(name: "Jane", age: 22)
      @flight2.passengers << Passenger.create(name: "Mark", age: 20)
      @flight2.passengers << Passenger.create(name: "Felicia", age: 23)
    end

    it "I can see a list of unique passengers that have flights from that airline" do
      visit "/airlines/#{@airline.id}"

      expect(page).to have_content(@airline.name)
      expect(page).to have_content("John")
      expect(page).to have_content("Jane")
    end

  end
end
