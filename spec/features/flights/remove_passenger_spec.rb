require "rails_helper"

RSpec.describe "Remove passenger", type: :feature do
  describe "As a visitor" do
    it "I can see a delete link next to each passenger in the flight index page" do
      @airline = Airline.create(name: "United")
      @flight = @airline.flights.create(flight_number: "UA123")
      @passenger = Passenger.create(name:"John", age:20)
      @flight.passengers << @passenger
      visit '/flights'
      within"#passenger-#{@passenger.id}"
        expect(page).to have_content("John")
        expect(page).to have_link("Remove")
        click_on "Remove"
      end
    end


  end
