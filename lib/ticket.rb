# frozen_string_literal: true

class Ticket
  attr_reader :number, :entry_time

  def initialize(spot_id)
    @number = "T-00#{spot_id}"
    @entry_time = Time.now
  end

  def to_s
    "Ticket number #{@number}, entered at #{@entry_time}"
  end
end
