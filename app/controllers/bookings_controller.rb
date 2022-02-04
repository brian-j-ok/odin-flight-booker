class BookingsController < ApplicationController
    def new
        if params[:tickets].blank?
            flash.alert = 'You must select the number of passengers in your search in order to book a flight.'
            redirect_to root_url
        else
            @booking = Booking.new
            params[:tickets].to_i.times { @booking.passengers.build }
            @flight = Flight.find(params[:flight_id])
        end
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            flash.notice = "Flight successfully booked!"
            redirect_to booking_path(@booking.id)
        else
            @flight = Flight.find(params[:booking][:flight_id])
            render :new
        end
    end

    def show
        @booking = Booking.find(params[:id])
    end

    private
    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end
end
