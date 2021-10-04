require 'rails_helper'

RSpec.describe 'DestroyingLikes', type: :system do
  let(:user) { create(:user) }
  let(:create_post) { create(:post) }

  before do
    driven_by(:rack_test)

    create_post

    create(
      :like,
      user_id: user.id,
      post_id: create_post.id
    )

    sign_in user
    visit posts_path
    click_on 'Unlike'
  end

  context 'when likes modal is opened' do
    it 'does not show liker' do
      within('.post-like-content') do
        expect(page).not_to have_content("#{user.first_name} #{user.last_name}")
      end
    end
  end

  context 'when likes modal is closed' do
    it 'shows like button' do
      expect(page).to have_content('Like')
    end
  end
end
