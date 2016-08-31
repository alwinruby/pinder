require "rails_helper"

feature "Playing pinder" do
  context "A user wants to play pinder" do
    scenario "A user sees a picture of another users pet" do
      sign_up
      create_profile
      visit "/play"
      expect(page).to have_css("//img[@src*='banana.jpg']")
    end
  end
end
