# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Session do
  before do
    Role.create(roletype: 'Admin')
    Role.create(roletype: 'Student')
    User.create(email: 'test@gmail.com', password: 'test',
                role_id: Role.find_by(roletype: 'Student').id)
    User.create(email: 'admin@gmail.com', password: 'test',
                role_id: Role.find_by(roletype: 'Admin').id)
  end

  describe 'User enter' do
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
      expect(page).to have_text('Log Out')
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
      expect(page).to have_text('Log Out')
      click_on 'Log Out'
      expect(page).to have_text('Logged out!')
    end
  end
end
