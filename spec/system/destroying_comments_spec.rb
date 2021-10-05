require 'rails_helper'

RSpec.describe 'DestroyingComments', type: :system do
  let(:user) { create(:user) }
  let(:create_post) { create(:post) }

  let(:create_comment) do
    create(
      :comment,
      user_id: user.id,
      post_id: create_post.id
    )
  end

  before do
    driven_by(:rack_test)

    create_post
    create_comment
    sign_in user
    visit posts_path
    find('a[class*="delete-comment"]').click
  end

  it 'does not show destroyed comment' do
    expect(page).not_to have_content(create_comment.content)
  end
end
