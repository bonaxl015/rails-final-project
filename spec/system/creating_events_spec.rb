require 'rails_helper'

RSpec.describe 'CreatingEvents', type: :system do
  let(:create_event) { create(:event) }

  before do
    driven_by(:rack_test)

    create_event
    sign_in create(:user)
    visit events_path(tab: 'all_events')
  end

  it 'shows add event button' do
    expect(page).to have_content('Add Event')
  end

  it 'shows created event' do
    expect(page).to have_content(create_event.name)
  end
end
