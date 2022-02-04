class FlightsController < ApplicationController
    def index
        puts :flight.to_s
        @airports = Airport.all.map{ |a| [a.airport_city, a.id ] }
        @flights = Flight.where(flight_params).includes(:departure_airport, :arrival_airport)
    end

    def flight_params
        params.require(:flight).permit(:departure, :arrival)
    end
end
