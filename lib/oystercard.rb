class Oystercard
  attr_reader :balance

  MAX_LIMIT = 90
  MIN_FARE = 1
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(n)
    raise "You couldn't have more than £90 on your card" if @balance + n > MAX_LIMIT
    @balance += n 
    "New balance: #{@balance}"
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Cannot touch in with insufficient funds" if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  private
  def deduct(n)
    @balance -= n
    "New balance: #{@balance}"
  end
end
