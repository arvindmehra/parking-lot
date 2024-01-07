# frozen_string_literal: true

require_relative 'ticket'
require_relative 'receipt'

class Spot
  attr_reader :spot_id, :vehicle, :ticket, :receipt

  def initialize(spot_id)
    @spot_id = spot_id
    @vehicle = nil
    @ticket = nil
    @receipt = nil
  end

  def park_vehicle(vehicle)
    @vehicle = vehicle
  end

  def unpark_vehicle
    @vehicle = nil
    @ticket = nil
    @receipt = nil
  end

  def available?
    @vehicle.nil?
  end

  def issue_ticket
    @ticket = Ticket.new(spot_id)
  end

  def issue_receipt(parking_model, exit_time)
    @receipt = Receipt.new(self, parking_model, exit_time)
  end

  def vehicle_parked?
    !@vehicle.nil?
  end
end
