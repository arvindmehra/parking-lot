# frozen_string_literal: true

class ParkingLot
  attr_reader :level, :parking_model

  def initialize(num_levels, spots_per_level, parking_model)
    @parking_model = parking_model
    @levels = Array.new(num_levels) do |level|
      Level.new(level, spots_per_level)
    end
  end

  def park_vehicle(vehicle)
    return 'No Vehicle provided, No parking alloted' unless vehicle.present?

    if vehicle_allowed?(vehicle)
      @levels.each do |level|
        spot = level.find_available_spot
        next unless spot

        spot.park_vehicle(vehicle)
        spot.issue_ticket
        if spot.vehicle_parked?
          return "Parked Vehicle #{vehicle.license_plate}, #{vehicle.type} parked at #{parking_model} at Level #{level.level_id} at spot #{spot.spot_id} with #{spot.ticket}"
        end
      end
      'No Space Available'
    else
      "Parking not allowed for #{vehicle.type} at #{@parking_model} "
    end
  end

  def unpark_vehicle(level_id, spot_id, exit_time)
    if ((level = @levels[level_id])) && ((spot = level.spots[spot_id]) && spot.vehicle_parked?)
      spot.issue_receipt(parking_model, exit_time)
      puts "Unparked Vehicle #{spot.vehicle.license_plate}, #{spot.vehicle.type} from #{parking_model} from Level #{level_id}, Spot #{spot.spot_id}, with receipt #{spot.receipt}"
      spot.unpark_vehicle
    else
      "No Vehicle found at spot #{spot_id} at Level #{level_id} Invalid Level or Spot ID"
    end
  end

  def vehicle_allowed?(vehicle)
    if (parking_model == Constants::PARKING::STADIUM_PARKING) || (parking_model == Constants::PARKING::AIRPORT_PARKING)
      (Constants::PARKING::ACCEPTABLE_VEHICLES - %w[bus truck]).include?(vehicle.type)
    else
      Constants::PARKING::ACCEPTABLE_VEHICLES.include?(vehicle.type)
    end
  end
end
