# frozen_string_literal: true

class Vehicle
  attr_reader :license_plate, :type

  def initialize(license_plate, type)
    raise 'Vehicle type not supported' unless Constants::PARKING::ACCEPTABLE_VEHICLES.include?(type)

    @license_plate = license_plate
    @type = type
  end
end
