require './spec/spec_helper'

RSpec.describe BikeClub do
  before(:each) do
    @club = BikeClub.new("Cyclovia")
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe 'bikeclub' do
    it 'has a cool name' do
      expect(@club.name).to eq("Cyclovia")
    end

    it 'begins without bikers' do
      expect(@club.bikers).to eq([])
    end
  end

  describe 'add biker' do
    it 'can add bikers' do
      @club.add_biker(@biker1)
      expect(@club.bikers).to eq([@biker1])
      @club.add_biker(@biker2)
      expect(@club.bikers).to eq([@biker1, @biker2])
    end
  end

end