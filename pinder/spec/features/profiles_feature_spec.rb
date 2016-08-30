require 'rails_helper'

feature "Profile creation" do
  context "A user doesn't yet have a profile" do
    scenario "Hasn't got a profile" do
      visit '/profiles'
      expect(page).to have_content("You don't yet have a profile")
    end

    scenario "A user can create a profile" do
      visit '/profiles'
      click_link "Create Profile"
      expect(current_path).to eq('/profiles/new')
    end

    scenario "A user can fill out the profile form" do
      visit '/profiles'
      click_link "Create Profile"
      fill_in "Owner name", with: "Adam"
      fill_in "Owner age", with: "24"
      fill_in "Owner likes", with: "Country Music, Big Women and Folk Dancing"
      fill_in "Owner dislikes", with: "Joe Sweeny, golf and cheese"
      fill_in "Pet name", with: "Finn"
      fill_in "Pet age", with: 2
      fill_in "Pet species", with: "Dog - Golden Retriever"
      fill_in "Pet likes", with: "Carrots"
      fill_in "Pet dislikes", with: "Bald men"
      click_button "Submit Profile"
      expect(page).to have_content "Adam"
    end
  end
end
