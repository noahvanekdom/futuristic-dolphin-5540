# tory 1 - Mechanic Index Page

# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics



require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  let!(:six_flags) { AmusementPark.create!(name: 'Six Flags', admission_cost: 75) }
  let!(:universal) { AmusementPark.create!(name: 'Universal Studios', admission_cost: 80) }
  let!(:hurler) { six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true) }
  let!(:scrambler) { six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)}
  let!(:ferris) { six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false) }
  let!(:jaws) { universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true) }
  let!(:nate) { Mechanic.create!(name: "Nate", years_experience: 11) }
  let!(:malia) { Mechanic.create!(name: "Malia", years_experience: 9) }

  describe 'As a user, when I visit the mechanics index page' do
    before(:each) do
      visit '/mechanics/index'
    end
    it 'under a header, it lists all mechanics names and years of experience' do
      expect(page).to have_content("All mechanics")
      expect(page).to have_content("#{nate.name}")
      expect(page).to have_content("#{nate.years_experience}")
    end

    it 'also displays the average years of experience across all mechanics' do
      #COME BACK AND ADD WITHIN HERE (AS WELL AS TO_NOT)
      expect(page).to have_content(10)
      expect(page).to have_content("Experience")
    end
  end
end