def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'testuser1@test.com')
  fill_in('Password', with: 'test1234')
  fill_in('Password confirmation', with: 'test1234')
  click_button('Sign up')
end

def create_profile
  visit '/profiles'
  click_link "Create Profile"
  fill_in "Owner name", with: "Adam"
  fill_in "Owner age", with: "24"
  select "Male", from: "Gender"
  select "Straight", from: "Sexual preference"
  fill_in "Owner likes", with: "Country Music, Big Women and Folk Dancing"
  fill_in "Owner dislikes", with: "Joe Sweeny, golf and cheese"
  fill_in "Pet name", with: "Finn"
  fill_in "Pet age", with: 2
  select "Dog", from: "Pet species"
  fill_in "Pet likes", with: "Carrots"
  fill_in "Pet dislikes", with: "Bald men"
  page.attach_file("profile_owner_image", Rails.root + 'app/assets/images/me.jpeg')
  page.attach_file("profile_pet_image", Rails.root + 'app/assets/images/banana.jpg')
  click_button "Submit Profile"
  # expect(page).to have_content "Adam"
  # expect(page).to have_css("//img[@src*='me.jpeg']")
  # expect(page).to have_css("//img[@src*='banana.jpg']")
end
