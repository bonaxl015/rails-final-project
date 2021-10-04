require 'rails_helper'

RSpec.describe "SearchingUsers", type: :system do
  let(:searched_user) { create(:user) }

  before do
    driven_by(:rack_test)

    searched_user
    sign_in create(:user)
    visit posts_path
    fill_in 'Search user', with: searched_user.username
    click_on 'Search', match: :first
  end

  it 'shows searched user' do
    expect(page).to have_content(searched_user.username)
  end
end
