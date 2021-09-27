class Oystercard
  attr_reader :balance
  def initialize
    @balance = 0
  end

  def top_up(n)
    @balance += n 
    return "New balance: #{@balance}"
  end  
end
