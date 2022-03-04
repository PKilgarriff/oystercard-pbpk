require 'journey'

class Oystercard
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :journeys

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @current_journey = Journey.new
  end

  def top_up(money)
    fail 'Maximum limit reached' if over_limit?(money)

    @balance += money
  end

  def touch_in(entry_station)
    deduct unless @current_journey.journey_record[:entry].nil?
    fail 'Insufficient Funds' if under_min_balance?

    @current_journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    @current_journey.end_journey(exit_station)
    deduct
  end

  private

  def over_limit?(money)
    @balance + money > MAX_BALANCE
  end

  def under_min_balance?
    @balance < MIN_FARE
  end

  def deduct
    @balance -= @current_journey.journey_record[:fare]
  end
end

