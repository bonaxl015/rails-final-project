require 'rails_helper'

RSpec.describe 'CreatingComments', type: :system do
  let(:attributes) { attr_strat(:comment) }

  before do
    driven_by(:rack_test)

    create(:post)
    sign_in create(:user)
    visit posts_path
    fill_in 'Write a comment...', with: attributes[:content]
    click_on 'Comment'
  end

  it 'shows created comment' do
    within(".comment-layout") do
      expect(page).to have_content(attributes[:content])
    end
  end
end
