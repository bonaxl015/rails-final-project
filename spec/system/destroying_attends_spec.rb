require 'rails_helper'

RSpec.describe 'DestroyingAttends', type: :system do
  let(:user) { create(:user) }
  let(:create_event) { create(:event) }

  let(:create_attend) do
    create(
      :attend,
      event_id: create_event.id,
      user_id: user.id
    )
  end

  before do
    driven_by(:rack_test)

    create_event
    create_attend
    sign_in user
    visit events_path(tab: 'all_events')
    click_on 'Cancel', match: :first
  end

  context 'when event modal is opened and navigated through attendees tab' do
    it 'does not show attendee' do
      within('.attendees-modal', match: :first) do
        expect(page).not_to have_content("#{user.first_name} #{user.last_name}")
      end
    end
  end

  context 'when event modal is closed' do
    it 'does not show attending message' do
      expect(page).not_to have_content('You are going to this event.')
    end
  end
end
