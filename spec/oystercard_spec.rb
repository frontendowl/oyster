require 'oystercard'

RSpec.describe Oystercard do
  it "initialized with balance 0" do
    expect(subject.balance).to eq 0 
  end

  it "add money to the card" do
    expect(subject.top_up(80)).to eq "New balance: 80"
  end

  it "raises an error when trying to exceed maximum limit of 90" do
    expect { subject.top_up(100) }.to raise_error "You couldn't have more than £90 on your card"
  end

  it 'deduct money from the card' do
    subject.top_up(10)
    expect(subject.deduct(10)).to eq "New balance: 0"
  end

  it 'tracks if user is currently in journey (default false)' do
    expect(subject.in_journey?).to eq false
  end

  it 'starts journey after touch in' do
    subject.touch_in
    expect(subject.in_journey?).to eq true
  end

  it 'ends journey after touch out' do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end
end
