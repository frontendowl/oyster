class Journey
  attr_reader :start_station, :finish_station
  def initialize(start)
    @start_station = start
    @finish_station = nil
  end

  def finish(station)
    @finish_station = station
  end
end