require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  newPlace = Place.create(name:"place")
  newAnimal = Animal.create(place:newPlace, name:"Animal")
  newArtifact = Artifact.create(place:newPlace, name:"Artifact")
  newFlora = Flora.create(place:newPlace, name:"Flora")

  describe Place 'getAnimal' do
    it 'always returns an instance of subclass Animal' do
      expect(newPlace.getAnimal).to be_an_instance_of(Animal)
    end
  end

  describe Place 'getArtifact' do
    it 'always returns an instance of subclass Artifact' do
      expect(newPlace.getArtifact).to be_an_instance_of(Artifact)
    end
  end

  describe Place 'getFlora' do
    it 'always returns an instance of subclass Flora' do
      expect(newPlace.getFlora).to be_an_instance_of(Flora)
    end
  end

  describe Place 'discoveryChance' do

    it 'returns nil if roll result and progress multiplier adds to less than 50' do
      expect(newPlace.discoveryChance(-9)).to eq [nil]
    end


  end



end
