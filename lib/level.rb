# frozen_string_literal: true

class Level
  attr_reader :level_id, :spots

  def initialize(level_id, num_spots)
    @level_id = level_id

    @spots = Array.new(num_spots) do |spot|
      Spot.new(spot)
    end
  end

  def find_available_spot
    @spots.find(&:available?)
  end

  def to_s
    @level.to_s
  end
end
