require './spec/spec_helper'

RSpec.describe BikeClub do
  before(:each) do
    @club = BikeClub.new("Cyclovia")
    @biker1 = Biker.new("Kenny", 30)
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

  describe 'most rides' do
    it 'knows which biker has the most rides' do
      @club.add_biker(@biker1)
      @club.add_biker(@biker2)
      @biker1.learn_terrain!(:hills)
      @biker2.learn_terrain!(:hills)
      @biker1.log_ride(@ride1, 90)
      @biker1.log_ride(@ride1, 88)
      @biker2.log_ride(@ride1, 85)
      expect(@club.most_rides).to eq(@biker1)
    end
  end

  describe 'best time' do
    it 'knows who has the best time on a ride' do
      @club.add_biker(@biker1)
      @club.add_biker(@biker2)
      @biker1.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:gravel)     
      @biker1.log_ride(@ride2, 90)
      @biker1.log_ride(@ride2, 88)
      @biker2.log_ride(@ride2, 85)
      expect(@club.best_time(@ride2)).to eq(@biker2)
    end
  end

  describe 'bikers eligible' do 
    it 'knows which bikers are eligible for a ride' do
      @club.add_biker(@biker1)
      @club.add_biker(@biker2)
      @biker1.learn_terrain!(:hills)
      expect(@club.bikers_eligible(@ride1)).to eq([@biker1])
    end
  end
end