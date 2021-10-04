require 'rails_helper'

RSpec.describe 'CreatingPosts', type: :system do
  let(:attributes) { attr_strat(:post) }

  before do
    driven_by(:rack_test)

    sign_in create(:user)
    visit posts_path
    fill_in 'Share something...', with: attributes[:caption]
    click_on 'Post'
  end

  it 'shows created post' do
    expect(page).to have_content(attributes[:caption])
  end
end
