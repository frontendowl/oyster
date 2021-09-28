require "journey"


RSpec.describe Journey do
  let(:kings_cross) { double :station, :name => "Kings Cross", :zone => 1 }
  let(:oxford_circus) { double :station, :name => "Oxford Circus", :zone => 1 }

  describe "#initialize" do
    it "start journey with entry station" do
      journey = Journey.new(kings_cross)
      expect(journey.start_station).to eq(kings_cross)
    end
  end


  describe "#finish" do
    it "add finish station" do
      journey = Journey.new(kings_cross)
      journey.finish(oxford_circus)
      expect(journey.finish_station).to eq(oxford_circus)
    end
  end
end