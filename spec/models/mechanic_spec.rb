require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  let!(:nate) { Mechanic.create!(name: "Nate", years_experience: 11) }
  let!(:malia) { Mechanic.create!(name: "Malia", years_experience: 9) }

  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe '#average_experience' do
    it 'should return the average experience of all mechanics currently employed' do
      expect(Mechanic.average_experience).to eq(10)
    end
  end
end