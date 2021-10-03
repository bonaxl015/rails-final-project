require 'rails_helper'

RSpec.describe 'Events', type: :request do
  subject(:event) { create(:event) }

  let(:valid_attributes) { attr_strat(:event) }
  let(:invalid_attributes) { attr_strat(:event, :invalid_attributes) }

  shared_context 'when user signed in' do
    before do
      sign_in create(:user)
    end
  end

  shared_examples 'renders a successful response' do
    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  shared_examples 'redirects to base url' do
    it 'redirects to base url' do
      expect(response).to redirect_to("#{request.base_url}/")
    end
  end

  describe 'GET /index' do
    include_context 'when user signed in'

    before do
      get events_path
    end

    include_examples 'renders a successful response'
  end

  describe 'GET /new' do
    include_context 'when user signed in'

    before do
      get new_event_path, xhr: true
    end

    include_examples 'renders a successful response'
  end

  describe 'GET /edit' do
    include_context 'when user signed in'

    before do
      get edit_event_path(event), xhr: true
    end

    include_examples 'redirects to base url'
  end

  describe 'POST /create' do
    include_context 'when user signed in'

    context 'with valid parameters' do
      before do
        post events_path, params: { event: valid_attributes }
      end

      it 'creates an event' do
        expect do
          post events_path, params: { event: valid_attributes }
        end.to change(Event, :count).by(1)
      end

      it 'redirects to events' do
        expect(response).to redirect_to(events_path)
      end
    end

    context 'with invalid parameters' do
      before do
        post events_path, params: { event: invalid_attributes }
      end

      it 'does not create an event' do
        expect do
          post events_path, params: { event: invalid_attributes }
        end.to change(Event, :count).by(0)
      end

      it 'renders unprocessable entity response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    include_context 'when user signed in'

    context 'with valid parameters' do
      let(:new_attributes) { attr_strat(:event, :new_attributes) }

      before do
        patch event_path(event), params: { event: new_attributes }
      end

      it 'updates the event' do
        event.update(new_attributes)
        expect(Event.find_by(new_attributes)).not_to eq(nil)
      end

      include_examples 'redirects to base url'
    end

    context 'with invalid parameters' do
      before do
        patch event_path(event), params: { event: invalid_attributes }
      end

      it 'does update the event' do
        event.update(invalid_attributes)
        expect(Event.find_by(invalid_attributes)).to eq(nil)
      end

      include_examples 'redirects to base url'
    end
  end

  describe 'DELETE /destroy' do
    include_context 'when user signed in'

    before do
      delete event_path(event)
    end

    it 'deletes the event' do
      expect do
        event.destroy
      end.to change(Event, :count).by(-1)
    end

    include_examples 'redirects to base url'
  end

  context 'when user not signed in' do
    describe 'GET /index' do
      before do
        get events_path
      end

      it 'redirects to home' do
        expect(response).to redirect_to(static_home_path)
      end
    end

    describe 'GET /new' do
      before do
        get new_event_path, xhr: true
      end

      it 'renders unauthorized response' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'GET /edit' do
      before do
        get edit_event_path(event), xhr: true
      end

      include_examples 'redirects to base url'
    end
  end
end
