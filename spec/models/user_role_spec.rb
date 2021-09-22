require 'rails_helper'

RSpec.describe UserRole, type: :model do
  subject(:user_role) { create(:user_role) }

  it 'belongs to user' do
    expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'belongs to role' do
    expect(described_class.reflect_on_association(:role).macro).to eq(:belongs_to)
  end

  describe '#user' do
    it 'invalidates null' do
      user_role.user = nil
      user_role.valid?
      expect(user_role.errors[:user].size).to eq(2)
    end
  end

  describe '#role' do
    it 'invalidates null' do
      user_role.role = nil
      user_role.valid?
      expect(user_role.errors[:role].size).to eq(2)
    end
  end
end
