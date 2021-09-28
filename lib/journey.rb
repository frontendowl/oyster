class Journey
  attr_reader :entry_station, :exit_station, :price

  PENALTY_FARE = 5
  MIN_FARE = 1

  def initialize(start)
    @entry_station = start
    @exit_station
    @price
  end

  def finish(station)
    @exit_station = station
    @price = fare
  end

  def finished?
    @exit_station != nil
    
  end

  private
  def fare
    return @entry_station == nil || exit_station == nil ? PENALTY_FARE : MIN_FARE
  end
end

=begin
  PENALTY_FARE = 5
  MIN_FARE = 1

  methods:
  1. start
  2. finish
  3. fare (private?)
  4. finished?

  instance variables:
  :entry_station 
  :exit_station
  :price

=end