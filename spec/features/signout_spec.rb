require 'rails_helper'

  feature 'Sign Out' do

    before :each do
      User.destroy_all
    end

    scenario 'allows a user to sign out' do

      create_user

      visit sign_in_path

      fill_in :user_email, with: 'testyMcTesterson@example.com'
      fill_in :user_password, with: 'password'
      click_button 'Sign In'

      expect(current_path).to eq competitions_path
      expect(page).to have_content 'Such workout, much fitness'

      click_on 'Sign Out'

      expect(page).to have_content 'Sign In'
      expect(page).to have_content 'You have successfully logged out'
    end
end
