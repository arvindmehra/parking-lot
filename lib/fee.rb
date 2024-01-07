# frozen_string_literal: true

class Fee
  attr_reader :parking_model, :duration, :vehicle_type

  def initialize(vehicle_type:, duration:, parking_model:)
    @vehicle_type = vehicle_type
    @duration = duration
    @parking_model = parking_model
  end

  def calculate_fee
    case parking_model
    when Constants::PARKING::MALL_PARKING
      calculate_fee_for_mall(vehicle_type, duration)
    when Constants::PARKING::STADIUM_PARKING
      calculate_fee_for_stadium(vehicle_type, duration)
    when Constants::PARKING::AIRPORT_PARKING
      calculate_fee_for_airport(vehicle_type, duration)
    end
  end

  def calculate_fee_for_mall(vehicle_type, duration)
    case vehicle_type
    when 'motorcyle', 'scooter'
      (duration / 60.00).ceil * 10
    when 'car', 'suv'
      (duration / 60.00).ceil * 20
    when 'bus', 'truck'
      (duration / 60.00).ceil * 50
    end
  end

  def calculate_fee_for_airport(vehicle_type, duration)
    case vehicle_type
    when 'motorcyle', 'scooter'
      airport_parking_fee_scooter(duration)
    when 'car', 'suv'
      airport_parking_fee_car(duration)
    when 'bus', 'truck'
      duration * 50
    end
  end

  def airport_parking_fee_scooter(duration)
    case duration
    when (0...60)
      0
    when (60...480)
      40
    when (480...1440)
      60
    when (1440...10_000_000)
      ((duration / 60.00).ceil / 24.00).ceil * 80
    end
  end

  def airport_parking_fee_car(duration)
    case duration
    when (0...720)
      60
    when (720...1440)
      80
    when (1440...10_000_000)
      ((duration / 60.00).ceil / 24.00).ceil * 100
    end
  end

  def calculate_fee_for_stadium(vehicle_type, duration)
    if %w[motorcyle scooter].include?(vehicle_type)
      case duration
      when (0...240)
        30
      when (240...720)
        90
      when (720...10_000_000)
        (((duration / 60.00).ceil - 12) * 100) + 90
      end
    elsif %w[car suv].include?(vehicle_type)
      case duration
      when (0..240)
        60
      when (240...720)
        180
      when (720...10_000_000)
        (((duration / 60.00).ceil - 12) * 200) + 180
      end
    end
  end
end
