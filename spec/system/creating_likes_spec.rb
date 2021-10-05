require 'rails_helper'

RSpec.describe 'CreatingLikes', type: :system do
  let(:user) { create(:user) }

  before do
    driven_by(:rack_test)

    create(:post)
    sign_in user
    visit posts_path
    click_on 'Like'
  end

  context 'when likes modal is opened' do
    it 'shows liker' do
      within('.post-like-content') do
        expect(page).to have_content("#{user.first_name} #{user.last_name}")
      end
    end
  end

  context 'when likes modal is closed' do
    it 'shows unlike button' do
      expect(page).to have_content('Unlike')
    end

    it 'shows like count' do
      expect(page).to have_content('1 like')
    end
  end
end
