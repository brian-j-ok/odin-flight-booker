class Booking < ApplicationRecord
    belongs_to :flight

    has_many :passenger_bookings, dependent: :delete_all
    has_many :passengers, through: :passenger_bookings, inverse_of: :bookings

    accepts_nested_attributes_for :passengers

    private
    def find_or_create_passenger
        self.passengers = self.passengers.map do |passenger|
          Passenger.find_or_create_by(email: passenger.email, name: passenger.name)
        end
    end
end
