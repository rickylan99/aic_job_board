# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Job do
  before do
    # creates a user and auto logins in
    Role.create(roletype: 'Head Admin')
    Role.create(roletype: 'Admin')
    Role.create(roletype: 'Student')
    User.create(email: 'test@gmail.com', password: 'test',
                role_id: Role.find_by(roletype: 'Student').id)
    User.create(email: 'admin@gmail.com', password: 'test',
                role_id: Role.find_by(roletype: 'Admin').id)

    visit root_path
    within 'div#loginBox' do
      fill_in 'Email', with: 'admin@gmail.com'
      fill_in 'Password', with: 'test'
      click_on 'Log In'
    end
  end

  describe 'Creating Job' do
    it 'Job creation from job page' do
      visit firms_panel_path
      click_on 'New Firm'
      expect(page).to have_text('Create a New Firm') # test creating a new job
      fill_in 'Firm Name', with: 'Apple'
      attach_file 'logo_upload_button', 'chase.png'
      fill_in 'Description', with: 'be smart'
      fill_in 'Location', with: 'Seattle'
      # fill_in 'Company Name' , with: 'Apple'
      fill_in 'Industry', with: 'Apples are great'
      fill_in 'Firm Website', with: 'Freshmen'
      fill_in 'Firm LinkedIn', with: 'How are you?'
      fill_in 'Contact Name', with: 'Exaple Name'
      fill_in 'Contact Email', with: 'example@gmail.com?'
      fill_in 'Contact LinkedIn', with: 'How are you?'
      click_on 'Add Firm'
      expect(page).to have_text('Apple') # test creating a new job
      visit jobs_panel_path
      expect(page).to have_text('New Job') # test creating a new job
      click_on 'New Job'
      fill_in 'Job Title', with: 'Apple Engineer'
      fill_in 'Job Location', with: 'Seattle'
      # fill_in 'Company Name' , with: 'Apple'
      fill_in 'Description', with: 'Apples are great'
      fill_in 'Classifications', with: 'Freshmen'
      fill_in 'job_job_questions_attributes_0_question', with: 'How are you?'
      click_on 'Create Job'
      expect(page).to have_text('Apple Engineer')
      click_on 'View'
      click_on 'Delete'
      page.driver.browser.switch_to.alert.accept # test deleting job application (through the flash)
    end
  end

  describe 'Creating Firm' do
    it 'Job creation from job page' do
      visit firms_panel_path
      click_on 'New Firm'
      expect(page).to have_text('Create a New Firm') # test creating a new job
      fill_in 'Firm Name', with: 'Apple Engineer'
      fill_in 'Description', with: 'be smart'
      fill_in 'Location', with: 'Seattle'
      # fill_in 'Company Name' , with: 'Apple'
      fill_in 'Industry', with: 'Apples are great'
      fill_in 'Firm Website', with: 'Freshmen'
      fill_in 'Firm LinkedIn', with: 'How are you?'
      fill_in 'Contact Name', with: 'Exaple Name'
      fill_in 'Contact Email', with: 'example@gmail.com?'
      fill_in 'Contact LinkedIn', with: 'How are you?'
      click_on 'Add Firm'
      expect(page).to have_text('Firms') # test creating a new job
    end
  end
end
