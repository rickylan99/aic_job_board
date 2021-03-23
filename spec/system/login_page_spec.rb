# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Log In Page' do
  before do
    user = User.create(email: 'test@gmail.com', password: 'test')
  end

  describe 'User visits site' do
    it 'visits page' do
      visit root_path
      expect(page).to have_text('Log In')
    end
  end
  # sunny day scenario

  describe 'Log In' do
    it 'visits root page to log in' do
      visit root_path
      within 'div#loginBox' do
        fill_in 'Email', with: 'test@gmail.com'
        fill_in 'Password', with: 'test'
        click_on 'Log In'
      end
      expect(page).to have_text('New Job Posting')
      visit root_path
      expect(page).to have_text('New Job Posting')
    end
  end
  # rainy day scenario

  describe 'User visits site' do
    it 'visits page' do
      visit root_path
      fill_in 'Email', with: 'fake@gmail.com'
      fill_in 'Password', with: 'test'
      click_on 'Log In'
      expect(page).to have_text('Incorrect email or password')
    end
  end
  # log out test from the user account

  describe 'Logging out' do
    it 'logs out of the logged in account when done' do
      visit root_path
      within 'div#loginBox' do
        fill_in 'Email', with: 'test@gmail.com'
        fill_in 'Password', with: 'test'
        click_on 'Log In'
      end
      expect(page).to have_text('New Job Posting')
      click_on 'Log Out'
      expect(page).to have_text('Logged out!')
    end
  end
end
