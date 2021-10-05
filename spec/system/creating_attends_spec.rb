require 'rails_helper'

RSpec.describe 'CreatingAttends', type: :system do
  let(:user) { create(:user) }

  before do
    driven_by(:rack_test)

    create(:event)
    sign_in user
    visit events_path(tab: 'all_events')
    click_on 'Attend'
  end

  context 'when event modal is opened and navigated through attendees tab' do
    it 'shows attendee' do
      within('.attendees-modal', match: :first) do
        expect(page).to have_content("#{user.first_name} #{user.last_name}")
      end
    end
  end

  context 'when event modal is closed' do
    it 'shows attending message' do
      expect(page).to have_content('You are going to this event.')
    end
  end
end
