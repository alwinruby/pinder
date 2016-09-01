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


    # scenario "A user can fill out the profile form" do
    #   sign_up
    #   visit '/profiles'
    #   click_link "Create Profile"
    #   fill_in "Owner name", with: "Adam"
    #   fill_in "Owner age", with: "24"
    #   select "Male", from: "Gender"
    #   select "Straight", from: "Sexual preference"
    #   fill_in "Owner likes", with: "Country Music, Big Women and Folk Dancing"
    #   fill_in "Owner dislikes", with: "Joe Sweeny, golf and cheese"
    #   fill_in "Pet name", with: "Finn"
    #   fill_in "Pet age", with: 2
    #   select "Dog", from: "Pet species"
    #   fill_in "Pet likes", with: "Carrots"
    #   fill_in "Pet dislikes", with: "Bald men"
    #   page.attach_file("profile_owner_image", Rails.root + 'app/assets/images/me.jpeg')
    #   page.attach_file("profile_pet_image", Rails.root + 'app/assets/images/banana.jpg')
    #   click_button "Submit Profile"
    #   expect(page).to have_content "Adam"
    #   expect(page).to have_css("//img[@src*='me.jpeg']")
    #   expect(page).to have_css("//img[@src*='banana.jpg']")
    # end
  end
end
feature "Playing pinder" do
  context "A user wants to play pinder" do
    scenario "A user wants to play pinder" do
      sign_up
      create_profile
      visit '/profiles'
      click_link "Play"
      expect(page).to have_content("Your name: Adam")
    end

    scenario "A user sees a picture of another user's pet" do
      sign_up
      create_profile
      visit "/profiles"
      click_link "Play"
      expect(page).to have_css("//img[@src*='banana.jpg']")
    end
  end
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
