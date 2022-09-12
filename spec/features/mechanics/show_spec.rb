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
      nate.rides << scrambler
      nate.rides << hurler
      nate.rides << ferris
      visit "/mechanics/#{nate.id}"
    end

    it 'I see their name, years of experience' do
      expect(page).to have_content("Mechanic")
      expect(page).to have_content(nate.name)
      expect(page).to have_content(nate.years_experience)

      expect(page).to_not have_content(malia.name)
    end

    it 'I see each open ride that mechanic works on, and not the closed ones' do
      expect(page).to have_content(scrambler.name)
      expect(page).to_not have_content(ferris.name)
    end

    it 'and the rides are listed by thrill rating in descending order' do
      expect(hurler.name).to appear_before(scrambler.name)
    end
  end

  describe 'Adding a new ride to a mechanic ' do
    before(:each) do
      nate.rides << scrambler
      visit "/mechanics/#{nate.id}"
    end

    it 'has a form to add a ride to the mechanic' do
      expect(page).to have_content(scrambler.name)
      expect(page).to_not have_content(hurler.name)
      expect(page).to have_button("Submit")
    end

    describe 'when I fill in that field with an existing ride ID and hit submit' do
      it 'takes me back to that mechanic show page, and I see the name of the newly added ride' do
        fill_in "Ride ID", with: hurler.id
        click_on "Submit"

        expect(page).to have_content(hurler.name)
        expect(page).to_not have_content(ferris.name)
      end
    end
  end
end

