require 'rails_helper'

RSpec.describe 'SpaceNews', type: :request do

  context 'when user signed in' do
    shared_examples 'renders a successful response' do
      it 'renders a successful response' do
        expect(response).to be_successful
      end
    end

    before do
      sign_in create(:user)
    end

    describe 'GET /index' do
      before do
        get space_news_index_path
      end

      include_examples 'renders a successful response'
    end

    describe 'GET /search' do
      before do
        get search_space_news_index_path, params: { title: 'status', commit: 'Search' }
      end

      include_examples 'renders a successful response'
    end
  end

  context 'when user not signed in' do
    describe 'GET /index' do
      before do
        get space_news_index_path
      end

      it 'redirects to home' do
        expect(response).to redirect_to(static_home_path)
      end
    end
  end
end
