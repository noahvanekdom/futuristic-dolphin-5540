require 'rails_helper'


RSpec.describe 'Amusement Park Show Page' do
  let!(:six_flags) { AmusementPark.create!(name: 'Six Flags', admission_cost: 75) }
  let!(:universal) { AmusementPark.create!(name: 'Universal Studios', admission_cost: 80) }
  let!(:hurler) { six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true) }
  let!(:scrambler) { six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)}
  let!(:ferris) { six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false) }
  let!(:jaws) { universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true) }
  let!(:nate) { Mechanic.create!(name: "Nate", years_experience: 11) }
  let!(:malia) { Mechanic.create!(name: "Malia", years_experience: 9) }

  describe 'As a user, when I visit the amusement park show page' do
    before(:each) do
      visit "/amusement_parks/#{six_flags.id}"
    end

    it 'displays the name and price of admissions for the park' do
      expect(page).to have_content(six_flags.name)
      expect(page).to have_content(six_flags.admission_cost)
    end

    it 'displays the names of all rides at the amusement park' do
      expect(page).to have_content(hurler.name)
      expect(page).to have_content(scrambler.name)
      expect(page).to_not have_content(jaws.name)
    end

    it 'shows the average thrill rating of all the rides' do
      expect(page).to have_content(6)
    end
  end
end
