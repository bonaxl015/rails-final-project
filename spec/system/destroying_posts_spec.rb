require 'rails_helper'

RSpec.describe 'DestroyingPosts', type: :system do
  let(:user) { create(:user) }
  let(:create_post) { create(:post, user_id: user.id) }

  before do
    driven_by(:rack_test)

    create_post
    sign_in user
    visit posts_path
    find("a[href='/posts/#{create_post.id}']").click
  end

  it 'does not show destroyed post' do
    expect(page).not_to have_content(create_post.caption)
  end
end
