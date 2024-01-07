require_relative 'lib/level.rb'
require_relative 'lib/parking_lot.rb'
require_relative 'lib/spot.rb'
require_relative 'lib/vehicle.rb'
require_relative 'lib/ticket'
require_relative 'lib/receipt'
require_relative 'lib/fee'
require_relative 'lib/constants/parking'
require 'active_support/all'
require 'pry'

parking_lot_mall = ParkingLot.new(1, 2, "mall")    #creating parking lot with 1 level and 2 spots on every level in a mall
parking_lot_stadium = ParkingLot.new(3, 4, "stadium")    #creating parking lot with 3 level and 4 spots on every level at a stadium
parking_lot_airport = ParkingLot.new(5, 2, "airport")    #creating parking lot with 5 levels and 2 spots on every level on an airport

vehicle_scooter = Vehicle.new("123-BAT", "scooter")
vehicle_car = Vehicle.new("456-CAT", "car")
vehicle_suv = Vehicle.new("890-UFO", "suv")
vehicle_bus = Vehicle.new("158-FLY", "bus")
vehicle_motorcyle = Vehicle.new("258-RAT", "motorcyle")

puts "---------------------------1-Mall Parking--------------------------------------------------"

puts parking_lot_mall.park_vehicle(vehicle_motorcyle)
puts parking_lot_mall.park_vehicle(vehicle_scooter)
puts parking_lot_mall.park_vehicle(vehicle_scooter)
puts parking_lot_mall.unpark_vehicle(0, 0, (Time.now + 50.minutes) )
puts parking_lot_mall.park_vehicle(vehicle_motorcyle)
puts parking_lot_mall.unpark_vehicle(0, 1, (Time.now + 3.hour + 40.minutes) )


puts "---------------------------2-Mall Parking--------------------------------------------------"

puts parking_lot_mall.park_vehicle(vehicle_motorcyle)
puts parking_lot_mall.park_vehicle(vehicle_car)
puts parking_lot_mall.unpark_vehicle(0, 0, (Time.now + 3.hour + 30.minutes) )
puts parking_lot_mall.unpark_vehicle(0, 1, (Time.now + 6.hour + 1.minutes) )
puts parking_lot_mall.park_vehicle(vehicle_bus)
puts parking_lot_mall.unpark_vehicle(0, 0, (Time.now + 1.hour + 59.minutes) )



puts "--------------------------3-Stadium Parking---------------------------------------------------"

puts parking_lot_stadium.park_vehicle(vehicle_motorcyle)
puts parking_lot_stadium.park_vehicle(vehicle_motorcyle)
puts parking_lot_stadium.park_vehicle(vehicle_suv)
puts parking_lot_stadium.park_vehicle(vehicle_suv)

puts "------------------------------Stadium Unparking------------------------------------------------"

puts parking_lot_stadium.unpark_vehicle(0, 0, (Time.now + 3.hour + 40.minutes))
puts parking_lot_stadium.unpark_vehicle(0, 1, (Time.now + 14.hour + 59.minutes))
puts parking_lot_stadium.unpark_vehicle(0, 2, (Time.now + 11.hour + 30.minutes))
puts parking_lot_stadium.unpark_vehicle(0, 3, (Time.now + 13.hour + 5.minutes))



puts "------------------------4-Airport Parking----------------------------------------------------"

puts parking_lot_airport.park_vehicle(vehicle_motorcyle)
puts parking_lot_airport.park_vehicle(vehicle_motorcyle)
puts parking_lot_airport.park_vehicle(vehicle_motorcyle)
puts parking_lot_airport.park_vehicle(vehicle_car)
puts parking_lot_airport.park_vehicle(vehicle_suv)
puts parking_lot_airport.park_vehicle(vehicle_car)

puts "------------------------------Airport Unparking------------------------------------------------"

puts parking_lot_airport.unpark_vehicle(0, 0, (Time.now + 55.minutes))
puts parking_lot_airport.unpark_vehicle(0, 1, (Time.now + 14.hour + 59.minutes))
puts parking_lot_airport.unpark_vehicle(1, 0, (Time.now + 1.day + 12.hour))

puts parking_lot_airport.unpark_vehicle(1, 1, (Time.now + 50.minutes))
puts parking_lot_airport.unpark_vehicle(2, 0, (Time.now + 23.hour + 59.minutes))
puts parking_lot_airport.unpark_vehicle(2, 1, (Time.now + 3.day + 1.hour))

puts "------------------------------------------------------------------------------"
