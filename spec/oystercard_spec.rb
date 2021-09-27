require 'oystercard'

RSpec.describe Oystercard do
  it "initialized with balance 0" do
    expect(subject.balance).to eq 0 
  end

  it "add money to the card" do
    expect(subject.top_up(100)).to eq "New balance: 100"
  end
end
