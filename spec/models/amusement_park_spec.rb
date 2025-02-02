require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  let!(:six_flags) { AmusementPark.create!(name: 'Six Flags', admission_cost: 75) }
  let!(:universal) { AmusementPark.create!(name: 'Universal Studios', admission_cost: 80) }
  let!(:hurler) { six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true) }
  let!(:scrambler) { six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)}
  let!(:ferris) { six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false) }
  let!(:jaws) { universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true) }
  let!(:nate) { Mechanic.create!(name: "Nate", years_experience: 11) }
  let!(:malia) { Mechanic.create!(name: "Malia", years_experience: 9) }

  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'methods' do
    it '#rides_alph' do
      expect(six_flags.rides_alph).to eq([ferris, hurler, scrambler])
    end

    it '#avg_thrill' do
      expect(six_flags.avg_thrill_rating).to eq(6)
    end
  end
end