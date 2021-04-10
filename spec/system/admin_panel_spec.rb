# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User do
  before do
    # creates a user and auto logins in
    Role.create(roletype: 'Admin')
    Role.create(roletype: 'Student')
    User.create(email: 'test@gmail.com', password: 'test',
                role_id: Role.find_by(roletype: 'Student').id)
    User.create(email: 'admin@gmail.com', password: 'admin',
                role_id: Role.find_by(roletype: 'Admin').id)
    visit root_path
    within 'div#loginBox' do
      fill_in 'Email', with: 'admin@gmail.com'
      fill_in 'Password', with: 'admin'
      click_on 'Log In'
    end
  end
  
  describe 'user panel controls' do
    it 'navigates the user panel' do
      expect(page).to have_text('Internships')
      
      click_on 'Admin Panel'
      expect(page).to have_text('Admin Panel')
      click_on 'Users'
      expect(page).to have_text('User Information')
      within(:xpath,'/html/body/div[4]/div/div/table/tbody/tr[1]') do
      click_on 'View User'
      end
      expect(page).to have_text('Classification')
      click_on 'Back'
      expect(page).to have_text('Storage Used')
    end
  end
  
end