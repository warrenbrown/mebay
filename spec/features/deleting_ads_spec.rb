require 'rails_helper'

RSpec.feature 'Users can delete ads' do
  scenario 'successfully' do
    ad = FactoryGirl.create(:ad)
    visit '/'
    click_link ad.name
    click_link 'Delete'

    expect(page).to have_content 'Ad has been deleted.'
    expect(page).to have_no_content ad.name
  end
end
