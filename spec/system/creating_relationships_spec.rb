require 'rails_helper'

RSpec.describe 'CreatingRelationships', type: :system do
  let(:follower_user) { create(:user) }
  let(:followed_user) { create(:user) }

  before do
    driven_by(:rack_test)

    sign_in follower_user
    visit profile_path(followed_user)
    click_on 'Follow'
  end

  context 'when relationships modal is opened and navigated through followers tab' do
    it 'shows follower' do
      within('#relationships-modal') do
        expect(page).to have_content("#{follower_user.first_name} #{follower_user.last_name}")
      end
    end
  end

  context 'when relationships modal is closed' do
    it 'shows unfollow button' do
      expect(page).to have_content('Unfollow')
    end
  end
end
