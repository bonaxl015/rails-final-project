require 'rails_helper'

RSpec.describe 'DestroyingEvents', type: :system do
  let(:user) { create(:user) }
  let(:create_event) { create(:event, user_id: user.id) }

  before do
    driven_by(:rack_test)

    create_event
    sign_in user
    visit events_path(tab: 'all_events')
    first("a[href='/events/#{create_event.id}']").click
  end

  it 'does not show destroyed event' do
    expect(page).not_to have_content(create_event.name)
  end
end
