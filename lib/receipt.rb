# frozen_string_literal: true

class Receipt
  def initialize(spot, parking_model, exit_time)
    @receipt_number = "R-00#{spot.spot_id}"
    @entry_timestamp = spot.ticket.entry_time
    @exit_timestamp = exit_time
    @fee = Fee.new(vehicle_type: spot.vehicle.type, duration: calculate_duration_in_minutes,
                   parking_model: parking_model)
  end

  def to_s
    "#{@receipt_number}, entered at #{@entry_timestamp}, exited at #{@exit_timestamp} with a fee of #{@fee.calculate_fee} for #{readable_duration} "
  end

  def calculate_duration_in_minutes
    total_minutes = @exit_timestamp - @entry_timestamp
    (total_minutes / 60).to_i
  end

  def readable_duration
    hours = @fee.duration / 60
    minutes = @fee.duration % 60
    "#{hours}h #{minutes} min"
  end
end
