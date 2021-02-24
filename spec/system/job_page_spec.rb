require 'rails_helper'
RSpec.describe 'Job Page'  do
  before(:each) do
    #creates a user and auto logins in
    user = User.create(email: "test@gmail.com", password: "test")
    visit root_path
      within '.card' do
        fill_in 'Email', with: 'test@gmail.com'
        fill_in 'Password', with: 'test'
        click_on 'Log In'
      end
  end
  
  describe 'Creating Job' do
    it 'Job creation from job page' do     
        click_on 'New Job Posting'
        expect(page).to have_text('Create a New Job Posting') #test creating a new job
        fill_in 'company name', with: 'Apple'
        fill_in 'description' , with: 'Apples'
        click_on 'Create Job'
        expect(page).to have_text('New Job Posting') 
        click_on 'Info'
        click_on 'Edit'
        expect(page).to have_text('Update Job Details') #test updating job info
        fill_in 'company', with: 'Dell'
        fill_in 'description' , with: 'PC'
        click_on 'Update Job'
        click_on 'Delete'
        page.driver.browser.switch_to.alert.accept #test deleting job application (through the flash)

    end
  end
end
#sprint 2 need to add some test for fail