require 'rails_helper'

RSpec.describe 'SearchingSpaceNews', type: :system do
  before do
    driven_by(:rack_test)

    sign_in create(:user)
    visit posts_path
    find('a[href="/space_news"]').click
    fill_in 'Search Article', with: 'SpaceX'

    within('form[action="/space_news/search"]') do
      click_on 'Search'
    end
  end

  it 'shows searched article' do
    expect(page).to have_content('SpaceX')
  end
end
