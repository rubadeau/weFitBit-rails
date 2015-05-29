require 'rails_helper'

  feature 'Sign In' do

    before :each do
      User.destroy_all
    end

    scenario 'allows a user to sign in' do

      create_user

      visit sign_in_path

      expect(current_path).to eq '/sign-in'
      expect(page).to have_content 'Sign into weFitBit'

      fill_in "Email", with: 'testyMcTesterson@example.com'
      fill_in "Password", with: 'password'
      click_button "Let's do this"

      # expect(current_path).to eq dashboard_path
      # expect(page).to have_content 'Such workout, much fitness'
    end

    # scenario 'User redirected if error' do
    #   visit root_path
    #   click_link 'Sign In'
    #
    #   expect(current_path).to eq(sign_in_path)
    #   expect(page).to have_content 'Sign into weFitBit'
    #
    #   fill_in "Email", with: 'testyMcTesterson@example.com'
    #   fill_in "Password", with: 'pass'
    #   click_button "Let's do this"
    #
    #   expect(current_path).to eq(sign_in_path)
    #   expect(page).to have_content 'Email / Password combination is invalid'
    # end
end
