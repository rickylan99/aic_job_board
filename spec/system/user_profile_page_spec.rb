# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Job Page'  do
  before(:each) do
    #creates a user and auto logins in
    Role.create(roletype: "Admin")
    Role.create(roletype: "Student")
    user = User.create(email: "test@gmail.com", password: "test",role_id: Role.find_by_roletype("Student").id)
    user1 = User.create(email: "admin@gmail.com", password: "test",role_id: Role.find_by_roletype("Admin").id)
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
      expect(page).to have_text('Reset Password')
      fill_in 'Email', with: 'test@gmail.com'
      click_on 'Reset Password'
      expect(page).to have_text('E-mail sent with password reset instructions. Please check your Spam folder as well')
    end
  end
end
