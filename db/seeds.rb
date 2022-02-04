# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport::delete_all
Flight::delete_all

airports = Airport.create([
    { airport_city: 'Atlanta', airport_code: 'ATL' },
    { airport_city: 'Albany', airport_code: 'ALB' },
    { airport_city: 'Houston', airport_code: 'IAH' },
    { airport_city: 'Austin', airport_code: 'AUS' },
    { airport_city: 'Greensboro', airport_code: 'GSO' },
    { airport_city: 'Miami', airport_code: 'MIA' },
])

flights = Flight.create([
    { departure: airports.first.id, arrival: airports.last.id, date: '2022-02-10 17:25:45', duration: 130 },
    { departure: airports.last.id, arrival: airports.first.id, date: '2022-02-15 17:25:45', duration: 130 },
    { departure: airports.first.id, arrival: airports.last.id, date: '2022-02-15 17:25:45', duration: 130 },
    { departure: airports.last.id, arrival: airports.first.id, date: '2022-02-10 17:25:45', duration: 130 },
    { departure: airports[2].id, arrival: airports[3].id, date: '2022-02-10 17:25:45', duration: 130 },
])