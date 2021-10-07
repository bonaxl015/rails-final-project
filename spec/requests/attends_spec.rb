require 'rails_helper'

RSpec.describe 'Attends', type: :request do
  subject(:attend) { create(:attend, event_id: event.id) }

  let(:event) { create(:event) }
  let(:attributes) { attr_strat(:attend) }

  before do
    sign_in create(:user)
  end

  describe 'POST /create' do
    it 'creates an attend' do
      expect do
        post event_attends_path(event), params: { attend: attributes }
      end.to change(Attend, :count).by(1)
    end

    it 'redirects back' do
      post event_attends_path(event), params: { attend: attributes }
      expect(response).to redirect_to(events_path)
    end
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

    it 'redirects back' do
      expect(response).to redirect_to(events_path)
    end
  end
end
