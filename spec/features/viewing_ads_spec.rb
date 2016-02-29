require 'rails_helper'

RSpec.feature 'users can view ads' do
  scenario 'with ad details' do
    ad = FactoryGirl.create(:ad)
    visit '/'

    click_link ad.name
    expect(page.current_url).to eq ad_url(ad)
    expect(page).to have_content ad.name
  end
end
