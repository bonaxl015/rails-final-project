require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  subject(:like) { create(:like, post_id: faux_post.id) }

  let(:faux_post) { create(:post) }
  let(:attributes) { attr_strat(:like) }

  shared_context 'when user signed in' do
    before do
      sign_in create(:user)
    end
  end

  shared_examples 'redirects back' do
    it 'redirects back' do
      expect(response).to redirect_to(posts_path)
    end
  end

  describe 'POST /create' do
    include_context 'when user signed in'

    it 'creates a like' do
      expect do
        post post_likes_path(faux_post), params: { like: attributes }
      end.to change(Like, :count).by(1)
    end

    it 'redirects back' do
      post post_likes_path(faux_post), params: { like: attributes }
      expect(response).to redirect_to(posts_path)
    end
  end

  describe 'DELETE /destroy' do
    include_context 'when user signed in'

    before do
      delete post_like_path(faux_post, like), params: { like: attributes }
    end

    it 'creates a like' do
      expect do
        like.destroy
      end.to change(Like, :count).by(-1)
    end

    it 'redirects back' do
      expect(response).to redirect_to(posts_path)
    end
  end
end
