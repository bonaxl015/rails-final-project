require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'POST /registrations' do
    context 'with valid parameters' do
      before do
        post '/users', params: { user: attr_strat(:user) }
      end

      it 'redirects to posts' do
        expect(response).to redirect_to(posts_path)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/users', params: { user: attr_strat(:user, :invalid_attributes) }
      end

      it 'redirects to home' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
