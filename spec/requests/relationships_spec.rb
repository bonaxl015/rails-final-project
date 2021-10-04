require 'rails_helper'

RSpec.describe 'Relationships', type: :request do
  subject(:relationship) { create(:relationship) }

  let(:attributes) { attr_strat(:relationship) }

  shared_examples 'redirects to home' do
    it 'redirects to home' do
      expect(response).to redirect_to(static_home_path)
    end
  end

  describe 'POST /create' do
    before do
      post relationships_path, params: { relationship: attributes }
    end

    it 'creates a relationship' do
      expect do
        create(:relationship, attributes)
      end.to change(Relationship, :count).by(1)
    end

    include_examples 'redirects to home'
  end

  describe 'DELETE /destroy' do
    before do
      delete relationship_path(relationship)
    end

    it 'deletes the relationship' do
      expect do
        relationship.destroy
      end.to change(Relationship, :count).by(-1)
    end

    include_examples 'redirects to home'
  end
end
