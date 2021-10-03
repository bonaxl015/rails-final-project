require 'rails_helper'

RSpec.describe 'Attends', type: :request do
  subject(:attend) { create(:attend, event_id: event.id) }

  let(:event) { create(:event) }
  let(:attributes) { attr_strat(:attend) }

  shared_examples 'redirects back' do
    it 'redirects back' do
      expect(response).to redirect_to(events_path)
    end
  end

  before do
    sign_in create(:user)
  end

  describe 'POST /create' do
    before do
      post event_attends_path(event), params: { attend: attributes }
    end

    it 'creates an attend' do
      expect(Attend.find_by(attributes)).not_to eq(nil)
    end

    include_examples 'redirects back'
  end

  describe 'DELETE /destroy' do
    before do
      delete event_attend_path(event, attend)
    end

    it 'deletes the attend' do
      expect do
        attend.destroy
      end.to change(Attend, :count).by(-1)
    end

    include_examples 'redirects back'
  end
end
