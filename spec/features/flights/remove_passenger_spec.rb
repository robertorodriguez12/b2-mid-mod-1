require "rails_helper"

RSpec.describe "CONTROLLER_TEST", type: :feature do
  describe "As a visitor" do
    before :each do
      @airline = Airline.create(name: "United")
      @flight = @airline.flights.create(flight_number: "UA123")
      @flight.passengers << Passenger.create(name: "John", age: 20)
    end

    it "I can see a delete link next to each passenger in the flight index page" do

      visit '/flights'
      within"#flight-#{@flight.id}"
        expect(page).to have_content("John")
        expect(page).to have_link("Remove")
        click_on "Remove"
        expect(page).to_not have_content("John")
      end
    end


  end
