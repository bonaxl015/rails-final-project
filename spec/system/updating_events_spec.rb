require 'rails_helper'

RSpec.describe 'UpdatingEvents', type: :system do
  let(:user) { create(:user) }
  let(:create_event) { create(:event, user_id: user.id) }
  let(:new_attributes) { attr_strat(:event, :new_attributes) }

  before do
    driven_by(:rack_test)

    create_event
    create_event.update(new_attributes)
    sign_in user
    visit events_path(tab: 'all_events')
  end

  it 'shows edit event button' do
    expect(page).to have_content('Edit')
  end

  it 'shows updated event' do
    expect(page).to have_content(new_attributes[:name])
  end
end
