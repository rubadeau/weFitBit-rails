require 'rails_helper'

  feature 'Sign In' do

    before :each do
      User.destroy_all
    end

    scenario 'allows a user to sign in' do

      user = User.create!(
      :user_user_name, with: 'Testy',
      :user_email, with: 'testyMcTesterson@example.com',
      :user_password, with: 'password'
      :user_password_confirmation, with: 'password')

      visit sign_in_path

      expect(current_path).to eq '/sign-in'
      expect(page).to have_content 'Sign into weFitBit'
      click_button 'Sign In'
      expect(page).to have_content 'Email / Password combination is invalid'

      fill_in :user_email, with: 'testyMcTesterson@example.com'
      fill_in :user_password, with: 'password'
      click_button 'Sign In'

      expect(current_path).to eq competitions_path
      expect(page).to have_content 'Such workout, much fitness'
    end

    scenario 'User redirected if error' do
      visit root_path
      click_link 'Sign In'

      expect(current_path).to eq(sign_in_path)
      expect(page).to have_content 'Sign into weFitBit'

      fill_in :user_email, with: 'testyMcTesterson@example.com'
      fill_in :user_password, with: 'pass'
      click_button 'Sign In'

      expect(current_path).to eq(sign_in_path)
      expect(page).to have_content 'Email / Password combination is invalid'
    end
end
