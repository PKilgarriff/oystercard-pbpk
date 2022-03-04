class Journey
  PENALTY_FARE = 6
  MIN_FARE = 1

  def initialize
    @entry = nil
    @exit = nil
  end

  def start_journey(entry_station)
    @entry = entry_station
  end

  def end_journey(exit_station)
    @exit = exit_station
  end

  def complete?
    @entry != nil && @exit != nil
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def journey_record
    { entry: @entry, exit: @exit }
  end
end
