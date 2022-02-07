class PassengerMailer < ApplicationMailer
    default from: 'fakeflight@odinflightbooker.com'

    def confirmation_email
        @booking = Booking.find(params[:booking_id])
        @url = booking_url(@booking)
        mail(to: @booking.passengers.pluck(:email), subject: "You have booked Flight #{@booking.flight.id} from 
            #{@booking.flight.departure_airport.airport_city} to #{@booking.flight.arrival_airport.airport_city}!")
    end
end
