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
    @entry_station = station
  end

  def touch_out(station)
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

=begin
2 touch ins without touch out 
  - fix by checking if in journey in touch in

touch out when start station is nil
 -fix by initializing Journey in touch_out

 create method to add journey
=end