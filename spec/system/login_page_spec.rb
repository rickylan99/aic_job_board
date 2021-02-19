require 'rails_helper'

RSpec.describe 'User visits site', type: :system do
  it 'visits page' do
    visit root_path
    expect(page).to have_text('Log In')
  end
end