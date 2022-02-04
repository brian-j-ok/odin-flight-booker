class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure', inverse_of: :departing_flights
    belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival', inverse_of: :arriving_flights

    has_many :bookings

    attr_accessor :tickets
end
