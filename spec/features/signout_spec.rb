require 'rails_helper'

  feature 'Sign Out' do

    before :each do
      User.destroy_all
    end

    scenario 'allows a user to sign out' do

      create_user

      visit sign_in_path

      fill_in "Email", with: 'testyMcTesterson@example.com'
      fill_in "Password", with: 'password'
      click_button "Let's do this"

      # expect(current_path).to eq competitions_path
      # expect(page).to have_content 'Such workout, much fitness'

      click_on 'Sign Out'

      expect(page).to have_content 'Sign In'
      expect(page).to have_content 'Signed out!'
    end
end
