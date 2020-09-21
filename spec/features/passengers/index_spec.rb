require "rails_helper"

RSpec.describe "Visitor", type: :feature do
  describe "Visit visitor index" do
    @airline = Airline.create(name: "United")
    @airline2 = Airline.create(name: "Frontier")
    @flight = @airline.flights.create(flight_number: "UA123")
    @flight2 = @airline2.flights.create(flight_number: "FA123")
    @flight.passengers << Passenger.create(name: "John", age: 20)
    @flight.passengers << Passenger.create(name: "Jane", age: 22)
    @flight2.passengers << Passenger.create(name: "Mark", age: 21)
    @flight2.passengers << Passenger.create(name: "Felicia", age: 23)

    it "I can see names of all passengers and the number of flights they are in " do
      visit '/passengers'
      expect(page).to have_content("John")
      expect(page).to have_content("Jane")
      expect(page).to have_content("Mark")
      expect(page).to have_content("Felicia")
      # save_and_open_page
      # within"#passenger-#{Passenger.first}" do
      #   expect(page).to have_content(1)
      # end
    end

  end

end
