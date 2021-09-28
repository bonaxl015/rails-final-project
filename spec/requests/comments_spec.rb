require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  subject(:comment) { create(:comment, post_id: faux_post.id) }

  let(:faux_post) { create(:post) }
  let(:attributes) { attr_strat(:comment) }

  shared_context 'when user signed in' do
    before do
      sign_in create(:user)
    end
  end

  shared_examples 'redirects to posts' do
    it 'redirects to posts' do
      expect(response).to redirect_to(posts_path)
    end
  end

  describe 'POST /create' do
    include_context 'when user signed in'

    before do
      post post_comments_path(faux_post), params: { comment: attributes }
    end

    include_examples 'redirects to posts'
  end

  describe 'DELETE /destroy' do
    include_context 'when user signed in'

    before do
      delete post_comment_path(faux_post, comment), params: { comment: attributes }
    end

    include_examples 'redirects to posts'
  end
end
