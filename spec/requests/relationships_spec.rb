require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/relationships/index"
      expect(response).to have_http_status(:success)
    end
  end

end
