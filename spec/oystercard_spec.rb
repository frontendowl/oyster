require 'oystercard'

RSpec.describe Oystercard do
  it "initialized with balance 0" do
    expect(subject.balance).to eq 0 
  end
end
