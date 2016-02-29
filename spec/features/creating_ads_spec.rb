require 'rails_helper'

RSpec.feature 'Users can create ads' do
  before do
    visit '/'
    click_link 'New'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Ad name'
    fill_in 'Description', with: 'This Discription'
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Image url', with: 'url'
    click_button 'Create Ad'

    expect(page).to have_content 'Ad has been created.'
    expect(page).to have_content 'Ad name'
  end

  scenario 'with invalid attriburtes' do
    fill_in 'Name', with: ''
    click_button 'Create Ad'

    expect(page).to have_content 'Ad has not been created.'
    expect(page).to have_content "Name can't be blank"
  end
end
