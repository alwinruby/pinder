require "rails_helper"

feature "Like other users" do
  context "A user wants to like another user" do
    scenario "A user likes another user's pet" do
      sign_up
      create_profile
      visit '/'
      click_link "Play"
      click_button "Like"
      click_button "Like!"
      expect(page).to have_content("Likes: 1")
    end
  end
end
