class JourneyLog

  attr_reader :entry_station, :exit_station

  def initialize
    @journeys = [Journey.new]
  end

  def start(entry_station)
    current_journey.start_journey(entry_station)
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  # works out which journey object to call
  def current_journey
    @journeys.last.complete? ? Journey.new : @journeys.last
  end

  def list_journeys
    @journeys.each do |journey|
      puts [journey.journey_record[:entry],
      journey.journey_record[:exit]].join(' to ')
    end
  end
end

# a private method #current_journey should return an incomplete journey or create a new journey