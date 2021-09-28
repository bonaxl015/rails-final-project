require 'rails_helper'

RSpec.describe 'Statics', type: :request do
  context 'when user signed in' do
    before do
      sign_in create(:user)
    end

    describe 'GET /home' do
      before do
        get static_home_path
      end

      it 'redirects to posts' do
        expect(response).to redirect_to(posts_path)
      end
    end
  end

  context 'when user not signed in' do
    describe 'GET /home' do
      before do
        get static_home_path
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end
    end
  end
end
