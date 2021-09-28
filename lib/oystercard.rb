require_relative "./journey"

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

  # TODO: move to Journey
  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    start_journey(station) if in_journey?

    raise "Cannot touch in with insufficient funds" if @balance < MIN_FARE

    @entry_station = station
  end

  def touch_out(station)
    end_journey(station)
    @entry_station = nil
  end

  private
  def deduct(n)
    @balance -= n
    "New balance: #{@balance}"
  end

  public
  def start_journey(station)
    journey = Journey.new(station)
    #deduct(journey.price)
    @journeys << journey
  end

  def end_journey(station)
    if @journeys.empty? || @journeys.last.finished?
      start_journey(nil)
    end

    @journeys.last.finish(station)
    deduct(@journeys.last.price)

  end

end

=begin
2 touch ins without touch out 
  - fix by checking if in journey in touch in

touch out when start station is nil
 -fix by initializing Journey in touch_out

 create method to add 
 


 1. init
 2. top_up
 3. deduct (private)
 4. touch_in
 5. touch_out
 6. add_journey
 
 @jouneys = []
 @balance

 REMOVE:

 1. in_journey?
 do we need @entry_station as an instance variable
=end