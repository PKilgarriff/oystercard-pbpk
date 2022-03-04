class JourneyLog

  attr_reader :entry_station, :exit_station

  def initialize(journey_class)
    @journeys = []
    @ongoing_journey = journey_class
  end

  def start(entry_station)
    @ongoing_journey.start_journey(entry_station)
  end

  def finish(exit_station)
    @ongoing_journey.end_journey(exit_station)
    @journeys << @ongoing_journey.journey_record
  end

  # works out which journey object to call
  def current_journey
    @journeys.last.complete? ? Journey.new : @journeys.last
  end

  def list_journeys
    @journeys.each do |journey|
      puts [journey[:entry],
      journey[:exit]].join(' to ')
    end
  end
end

# a private method #current_journey should return an incomplete journey or create a new journey