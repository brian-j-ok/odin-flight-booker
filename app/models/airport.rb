class Airport < ApplicationRecord
    has_many :departing_flights, 
            foreign_key: 'departure', 
            class_name: 'Flight', 
            inverse_of: :departure_airport
    
    has_many :arriving_flights, 
            foreign_key: 'arrival', 
            class_name: 'Flight', 
            inverse_of: :arrival_airport
end
