require 'rails_helper'
RSpec.describe 'Job Page'  do
  before(:each) do
    
    #creates a user and auto logins in
    user = User.create(email: "test@gmail.com", password: "test")
    visit root_path
      within 'div#loginBox' do
        fill_in 'Email', with: 'test@gmail.com'
        fill_in 'Password', with: 'test'
        click_on 'Log In'
      end
  end
  
  describe 'Applying to new User' do
    it 'Creates a user application' do     
        click_on "About Access"
        expect(page).to have_text("What is AIC ACCESS?")
        click_on "About_Button"
        expect(page).to have_text("Application Form")
        fill_in 'First name', with: 'test1@gmail.com'
        fill_in 'Last name', with: 'test1'
        fill_in 'Email', with: 'test1@gmail.com'
        fill_in 'Phone number', with: 'test'
        #select 'Freshmen', from 'access_submission_classification'
        attach_file "file_upload_button" , "Z.pdf"
        fill_in 'access_submission_q1', with: 'I love this club so much'
        fill_in 'access_submission_q2', with: 'I love AIC access'
        fill_in 'access_submission_q3', with: 'I love AIC club so much'
        fill_in 'access_submission_q4', with: 'I club so much'
        click_on 'Apply'
        expect(page).to have_text("Application Submitted Sucessfully!")
        visit access_submissions_path
        expect(page).to have_text("Pending Applications")
        click_on "View Application"
        click_on "Accept"
        expect(page).to have_text("Account created successfully!")
    end
  end
  
end
