class AddAirlinesToFlights < ActiveRecord::Migration[5.2]
  def change
    add_reference :flights, :airline, foreign_key: true
  end
end
