# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   subject(:faux_post) { create(:post) }

#   let(:valid_attributes) { attr_strat(:post) }
#   let(:invalid_attributes) { attr_strat(:post, :invalid_attributes) }

#   shared_context 'when user signed in' do
#     before do
#       sign_in create(:user)
#     end
#   end

#   shared_examples 'renders a successful response' do
#     it 'renders a successful response' do
#       expect(response).to be_successful
#     end
#   end

#   shared_examples 'redirects to posts' do
#     it 'redirects to posts' do
#       expect(response).to redirect_to(posts_path)
#     end
#   end

#   shared_examples 'renders unprocessable entity response' do
#     it 'renders unprocessable entity response' do
#       expect(response).to have_http_status(:unprocessable_entity)
#     end
#   end

#   describe 'GET /index' do
#     include_context 'when user signed in'

#     before do
#       get posts_path
#     end

#     include_examples 'renders a successful response'
#   end

#   describe 'POST /create' do
#     include_context 'when user signed in'

#     context 'with valid parameters' do
#       before do
#         post posts_path, params: { post: valid_attributes }
#       end

#       include_examples 'redirects to posts'
#     end

#     context 'with invalid parameters' do
#       before do
#         post posts_path, params: { post: invalid_attributes }
#       end

#       include_examples 'renders unprocessable entity response'
#     end
#   end

#   describe 'GET /edit' do
#     include_context 'when user signed in'

#     before do
#       get edit_post_path(faux_post), xhr: true
#     end

#     include_examples 'renders a successful response'
#   end

#   describe 'PATCH /update' do
#     include_context 'when user signed in'

#     context 'with valid parameters' do
#       let(:new_attributes) { attr_strat(:post, :new_attributes) }

#       before do
#         patch post_path(faux_post), params: { post: new_attributes }
#       end

#       include_examples 'renders a successful response'
#     end

#     context 'with invalid parameters' do
#       before do
#         patch post_path(faux_post), params: { post: invalid_attributes }
#       end

#       include_examples 'renders unprocessable entity response'
#     end
#   end

#   describe 'DELETE /destroy' do
#     include_context 'when user signed in'

#     before do
#       delete post_path(faux_post)
#     end

#     include_examples 'renders a successful response'
#   end

#   describe 'GET /user_search' do
#     include_context 'when user signed in'

#     before do
#       get user_search_posts_path
#     end

#     include_examples 'renders a successful response'
#   end

#   context 'when user not signed in' do
#     shared_examples 'redirects to home' do
#       it 'redirects to home' do
#         expect(response).to redirect_to(static_home_path)
#       end
#     end

#     describe 'GET /index' do
#       before do
#         get posts_path
#       end

#       include_examples 'redirects to home'
#     end

#     describe 'GET /edit' do
#       before do
#         get edit_post_path(faux_post), xhr: true
#       end

#       it 'renders unauthorized response' do
#         expect(response).to have_http_status(:unauthorized)
#       end
#     end

#     describe 'GET /user_search' do
#       before do
#         get user_search_posts_path
#       end

#       include_examples 'redirects to home'
#     end
#   end
# end
