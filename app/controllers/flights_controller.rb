class FlightsController < ApplicationController
    def index
        @airports = Airport.all.order(:airport_city).map{ |a| [a.airport_city, a.id ] }
        if params[:flight]
            @flights = Flight.where(flight_params).includes(:departure_airport, :arrival_airport)
        else
            @flights = Flight.all
        end
    end

    def flight_params
        params.require(:flight).permit(:departure, :arrival)
    end
end
