require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on homepage' do
    it 'should see a \'sign in\' and a \'sign up\' button' do
      visit('/')
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
    end

    it 'should not see \'sign out\' button' do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'user signed in on homepage' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'testuser1@test.com')
      fill_in('Password', with: 'test1234')
      fill_in('Password confirmation', with: 'test1234')
      click_button('Sign up')
    end

    it 'should see \'sign out\' button' do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it 'should not see a \'sign in\' button and a \'sign up\' button' do
      visit('/')
      expect(page).not_to have_link('Sign up')
      expect(page).not_to have_link('Sign in')
    end
  end

end
