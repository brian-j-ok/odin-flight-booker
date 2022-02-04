class Passenger < ApplicationRecord
    has_many :passenger_bookings, dependent: :delete_all
    has_many :bookings, through: :passenger_bookings, inverse_of: :passenger
    has_many :flights, through: :bookings
end
