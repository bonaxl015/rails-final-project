require 'rails_helper'
RSpec.describe 'Errors', type: :request do
  describe 'GET /not_found' do
    it 'renders not found page' do
      get '/404'
      expect(response).to be_successful
    end
  end

  describe 'GET /unprocessable_entity' do
    it 'renders unprocessable entity page' do
      get '/422'
      expect(response).to be_successful
    end
  end

  describe 'GET /internal_server_error' do
    it 'renders internal server error page' do
      get '/500'
      expect(response).to be_successful
    end
  end
end
