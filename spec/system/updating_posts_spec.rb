require 'rails_helper'

RSpec.describe 'UpdatingPosts', type: :system do
  let(:create_post) { create(:post) }
  let(:new_attributes) { attr_strat(:post, :new_attributes) }

  before do
    driven_by(:rack_test)

    create_post
    create_post.update(new_attributes)
    sign_in create(:user)
    visit posts_path
  end

  it 'shows updated post' do
    expect(page).to have_content(new_attributes[:caption])
  end
end
