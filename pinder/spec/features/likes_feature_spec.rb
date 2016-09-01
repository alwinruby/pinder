require "rails_helper"

feature "Like button" do
  context "A user wants to like another user" do

    before do
      create_first_profile
      create_second_profile
    end

    scenario "A user likes another user's pet" do
      sign_up
      create_profile
      click_button "Like"
      expect(page).to have_content("Joe")
    end

    scenario "A user likes another user's photo" do
      sign_up
      create_profile
      click_button "Like"
      click_button 'Like'
      expect(page).to have_content("Buddy")
    end
  end
end

feature 'Dislike button' do
  context "A user wants to dislike another user" do
    before do
      create_first_profile
      create_second_profile
    end
    scenario "A user dislikes another user's pet" do
      sign_up
      create_profile
      click_button "Dislike"
      expect(page).to have_content("Dave")
    end
  end
end
