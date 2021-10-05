require 'rails_helper'

RSpec.describe 'DestroyingRelationships', type: :system do
  let(:follower_user) { create(:user) }
  let(:followed_user) { create(:user) }

  before do
    driven_by(:rack_test)

    create(
      :relationship,
      follower_id: follower_user.id,
      followed_id: followed_user.id
    )

    sign_in follower_user
    visit profile_path(followed_user)
    click_on 'Unfollow'
  end

  context 'when relationships modal is opened and navigated through followers tab' do
    it 'does not show follower' do
      within('#relationships-modal') do
        expect(page).not_to have_content("#{follower_user.first_name} #{follower_user.last_name}")
      end
    end
  end

  context 'when relationships modal is closed' do
    it 'shows follow button' do
      expect(page).to have_content('Follow')
    end
  end
end
