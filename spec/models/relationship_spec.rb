require 'rails_helper'

RSpec.describe Relationship, type: :model do
  it 'belongs to follower user' do
    expect(described_class.reflect_on_association(:follower_user).macro).to eq(:belongs_to)
  end

  it 'belongs to followed user' do
    expect(described_class.reflect_on_association(:followed_user).macro).to eq(:belongs_to)
  end
end
