# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Job do
  before do
    # creates a user and auto logins in
    Role.create(roletype: 'Admin')
    Role.create(roletype: 'Student')
    User.create(email: 'test@gmail.com', password: 'test',
                role_id: Role.find_by(roletype: 'Student').id)
    User.create(email: 'admin@gmail.com', password: 'test',
                role_id: Role.find_by(roletype: 'Admin').id)
    visit root_path
    within 'div#loginBox' do
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'test'
      click_on 'Log In'
    end
  end

  describe 'forget password' do
    it 'send a forget password email' do
      click_on 'Log Out'
      expect(page).to have_text('What Access members say')
      click_on 'Forgot password?'
      expect(page).to have_text('Forgot Your Password?')
      fill_in 'email', with: 'test@gmail.com'
      click_on 'Submit'
      expect(page).to have_text('E-mail sent with password reset instructions. Please check your Spam folder as well')
    end
  end
end
