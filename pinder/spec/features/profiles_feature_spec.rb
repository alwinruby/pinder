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

  end
end
