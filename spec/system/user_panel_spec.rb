# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User do
  before do
    # creates a user and auto logins in
    Role.create(roletype: 'Admin')
    Role.create(roletype: 'Student')
    User.create(email: 'test@gmail.com', password: 'test',
                role_id: Role.find_by(roletype: 'Student').id)
    public_id = 'w0qc7svuzjypp0mpj60e'
    file_name = 'Z.pdf'
    User.create(email: 'admin@gmail.com', password: 'admin',
                role_id: Role.find_by(roletype: 'Admin').id).documents.new(public_id: public_id, file_name: file_name,
                                                                           documenttype: 'resume').save

    visit root_path
    within 'div#loginBox' do
      fill_in 'Email', with: 'admin@gmail.com'
      fill_in 'Password', with: 'admin'
      click_on 'Log In'
    end
  end

  describe 'user panel controls' do
    it 'navigates the user panel' do
      expect(page).to have_text('Jobs')

      click_on 'Admin Panel'
      expect(page).to have_text('Admin Panel')
      click_on 'Users'
      expect(page).to have_text('Current User Information')
      within(:xpath, '/html/body/div[5]/div/div/table/tbody/tr[2]') do
        click_on 'View Student'
      end
      expect(page).to have_text('Classification')
      click_on 'Back'
      within(:xpath, '/html/body/div[5]/div/div/table/tbody/tr[2]') do
        click_on 'Delete Student'
        page.driver.browser.switch_to.alert.accept # test deleting job application (through the flash)'
      end
    end
  end

  describe 'user promote controls' do
    it 'navigates the user panel to promote' do
      expect(page).to have_text('Jobs')

      click_on 'Admin Panel'
      expect(page).to have_text('Admin Panel')
      click_on 'Users'
      expect(page).to have_text('Current User Information')
      within(:xpath, '/html/body/div[5]/div/div/table/tbody/tr[2]') do
        click_on 'View Student'
      end
      expect(page).to have_text('Classification')
      click_on 'Back'
      within(:xpath, '/html/body/div[5]/div/div/table/tbody/tr[2]') do
        click_on 'Promote to Admin'
        page.driver.browser.switch_to.alert.accept # test deleting job application (through the flash)'
      end
    end
  end

  describe 'user export' do
    it 'press user export' do
      click_on 'Admin Panel'
      expect(page).to have_text('Admin Panel')
      click_on 'Users'
      expect(page).to have_text('Current User Information')
      click_on 'Export All Student Resumes'
      expect(page).to have_text('Current User Information')
    end
  end

  describe 'jobs panel controls' do
    it 'navigates the user jobs' do
      expect(page).to have_text('Jobs')

      click_on 'Admin Panel'
      expect(page).to have_text('Admin Panel')
      click_on 'Jobs'
    end
  end

  describe 'firms panel controls' do
    it 'navigates the firms panel' do
      expect(page).to have_text('Jobs')

      click_on 'Admin Panel'
      expect(page).to have_text('Admin Panel')
      click_on 'Firms'
    end
  end
end
