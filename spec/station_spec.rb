require "station"

RSpec.describe Station do
   it "can be created with a zone" do
    station = Station.new("kings cross",1)
    expect(station.zone).to eq(1)
   end

   it "can be created with name" do
    station = Station.new("kings cross",1)
    expect(station.name).to eq("kings cross")
   end
end
