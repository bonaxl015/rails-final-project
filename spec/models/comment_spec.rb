require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { create(:comment) }

  it 'belongs to post' do
    expect(described_class.reflect_on_association(:post).macro).to eq(:belongs_to)
  end

  it 'belongs to user' do
    expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  describe '#content' do
    it 'invalidates null' do
      comment.content = nil
      comment.valid?
      expect(comment.errors[:content].size).to eq(1)
    end
  end
end
