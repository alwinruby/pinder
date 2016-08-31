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

  context 'User needs to be signed in' do
    scenario 'user must be signed in to view profiles' do
      sign_up
      create_profile
      click_link 'Sign out'
      expect(page).not_to have_content 'Adam'
    end
  end

end
