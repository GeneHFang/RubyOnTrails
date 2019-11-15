require 'test_helper'

class DiscoveryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


#   # Prefix class methods with a '.'
# describe User, '.active' do
#   it 'returns only active users' do
#     # setup
#     active_user = create(:user, active: true)
#     non_active_user = create(:user, active: false)

#     # exercise
#     result = User.active

#     # verify
#     expect(result).to eq [active_user]

#     # teardown is handled for you by RSpec
#   end
# end

    #Discovery objects are dependent on a Place existing 
    newPlace = Place.create(name:"Place")

  describe Discovery 'getValue' do
    it 'sets value to 3200 if of subclass Animal' do
      
      newAnimal = Animal.create(place:newPlace, name:"Animal")

      expect(newAnimal.getValue).to eq [3200]

    end

    it 'sets value to 100,000 if of subclass Artifact' do

      newArtifact = Artifact.create( place:newPlace, name:"Artifact")

      expect(newArtifact.getValue).to eq [100000]

    end
  end

  describe Discovery 'roll' do
    it 'rolls number between 1 and 100' do
      newDisc = Discovery.create(place:newPlace, name:"Discovery")

      expect(newDisc.roll)to
    end
  end
  

end
