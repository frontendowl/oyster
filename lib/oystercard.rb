class Oystercard
  attr_reader :balance, :entry_station, :journeys

  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @entry_station
    @journeys = []
  end

  def top_up(n)
    raise "You couldn't have more than £90 on your card" if @balance + n > MAX_LIMIT
    @balance += n 
    "New balance: #{@balance}"
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise "Cannot touch in with insufficient funds" if @balance < MIN_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out(station)
    @in_journey = false
    deduct(MIN_FARE)
    @journeys << { entry: @entry_station, exit: station }
    @entry_station = nil
  end

  private
  def deduct(n)
    @balance -= n
    "New balance: #{@balance}"
  end
end
