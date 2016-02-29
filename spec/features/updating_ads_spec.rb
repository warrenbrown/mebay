require 'rails_helper'

RSpec.feature 'Users can update ads' do
  before do
    ad = FactoryGirl.create(:ad)
    visit '/'
    click_link ad.name
    click_link 'Edit'
  end
  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Moose Knuckles'
    click_button 'Update Ad'

    expect(page).to have_content 'Moose Knuckles'
  end

  scenario 'with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Ad'

    expect(page).to have_content 'Ad has not been updated'
    expect(page).to have_content "Name can't be blank"
  end
end
