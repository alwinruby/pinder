def sign_up
  visit('/')
  click_button('Sign up')
  fill_in('Email', with: 'testuser1@test.com')
  fill_in('Password', with: 'test1234')
  fill_in('Password confirmation', with: 'test1234')
  click_button('Sign up')
end
