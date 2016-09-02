require 'rails_helper'

feature "Profile creation" do
  context "A user doesn't yet have a profile" do
    scenario "Hasn't got a profile" do
      sign_up
      visit '/profiles'
      expect(page).to have_content("You don't yet have a profile")
    end

    scenario "A user can create a profile" do
      sign_up
      visit '/profiles'
      click_link "Create Profile"
      expect(current_path).to eq('/profiles/new')
    end
  end
end
feature "Playing pinder" do
  context 'User needs to be signed in' do
    scenario 'user must be signed in to view profiles' do
      sign_up
      create_profile
      click_link 'Sign out'
      expect(page).not_to have_content 'Adam'
    end
  end

  context 'User requires a profile' do
    before { Profile.create owner_name: 'Bob'}
    scenario 'user must have a profile to view other profiles' do
      sign_up
      expect(page).not_to have_content 'Bob'
    end
  end

  context 'user profile should be complete to validate' do
    scenario 'user should not be create new profile with nothing filled in' do
      sign_up
      click_link 'Create Profile'
      click_button 'Submit Profile'
      expect(page).to have_content 'error'
    end
  end

  context 'Viewing single profiles' do

    before do
      create_first_profile
      create_second_profile
    end

    scenario 'only view one profile per page' do
      sign_up
      create_profile
      expect(page).to have_content 'Buddy'
      expect(page).not_to have_content 'Fish'
    end
  end
end
