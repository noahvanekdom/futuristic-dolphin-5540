# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)


require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  let!(:six_flags) { AmusementPark.create!(name: 'Six Flags', admission_cost: 75) }
  let!(:universal) { AmusementPark.create!(name: 'Universal Studios', admission_cost: 80) }
  let!(:hurler) { six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true) }
  let!(:scrambler) { six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)}
  let!(:ferris) { six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false) }
  let!(:jaws) { universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true) }
  let!(:nate) { Mechanic.create!(name: "Nate", years_experience: 11) }
  let!(:malia) { Mechanic.create!(name: "Malia", years_experience: 9) }

  describe 'As a user, when I visit the mechanics show page' do
    before(:each) do
      visit '/mechanics/1'
    end

    it 'I see their name, years of experience, and the names of the rides they are working on' do
    end

    it 'I only see rides that are open' do

    end

    it 'and the rides are listed by thrill rating in descending order' do
    end
  end
end

