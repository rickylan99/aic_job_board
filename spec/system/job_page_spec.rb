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
        fill_in 'Email', with: 'admin@gmail.com'
        fill_in 'Password', with: 'test'
        click_on 'Log In'
      end
  end
  
  describe 'Creating Job' do
    it 'Job creation from job page' do
        visit firms_path       
        click_on 'New Firm'
        expect(page).to have_text('Create a New Firm') #test creating a new job
        fill_in 'Name', with: 'Apple Engineer'
        fill_in 'Description' , with: 'be smart'
        fill_in 'Location' , with: 'Seattle'
        #fill_in 'Company Name' , with: 'Apple'
        fill_in 'Industry' , with: 'Apples are great'
        fill_in 'Website' , with: 'Freshmen'
        fill_in 'LinkedIn' , with: 'How are you?'
        click_on 'Add Firm'
        expect(page).to have_text('List of firms') #test creating a new job
        visit jobs_path
        expect(page).to have_text('New Job Posting') #test creating a new job
        click_on 'New Job Posting'
        fill_in 'Job Title', with: 'Apple Engineer'
        fill_in 'Job Position' , with: 'be smart'
        fill_in 'Job Location' , with: 'Seattle'
        #fill_in 'Company Name' , with: 'Apple'
        fill_in 'Description' , with: 'Apples are great'
        fill_in 'Classifications' , with: 'Freshmen'
        fill_in 'job_job_questions_attributes_0_question' , with: 'How are you?'
        click_on 'Create Job'
        expect(page).to have_text('Apple Engineer') 
        click_on 'Info'
        click_on 'Delete'
        page.driver.browser.switch_to.alert.accept #test deleting job application (through the flash)

    end
  end
  describe 'Creating Firm' do
    it 'Job creation from job page' do
        visit firms_path       
        click_on 'New Firm'
        expect(page).to have_text('Create a New Firm') #test creating a new job
        fill_in 'Name', with: 'Apple Engineer'
        fill_in 'Description' , with: 'be smart'
        fill_in 'Location' , with: 'Seattle'
        #fill_in 'Company Name' , with: 'Apple'
        fill_in 'Industry' , with: 'Apples are great'
        fill_in 'Website' , with: 'Freshmen'
        fill_in 'LinkedIn' , with: 'How are you?'
        click_on 'Add Firm'
        expect(page).to have_text('List of firms') #test creating a new job
end
