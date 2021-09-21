require 'rails_helper'

RSpec.describe Role, type: :model do
  subject(:role) { create(:role_with_user_roles) }

  it 'has many user roles' do
    expect(described_class.reflect_on_association(:user_roles).macro).to eq(:has_many)
  end

  it 'has many users' do
    expect(described_class.reflect_on_association(:users).macro).to eq(:has_many)
  end

  it 'deletes its user roles' do
    role.destroy
    expect(UserRole.find_by(role_id: role.id)).to eq(nil)
  end

  describe '#role' do
    context 'when valid' do
      %w[Admin Moderator Ordinary].each do |valid_role|
        it "validates inclusion of #{valid_role}" do
          expect(build(:role, role: valid_role)).to be_valid
        end
      end
    end

    context 'when invalid' do
      Faker::Lorem.words(number: 3).each do |invalid_role|
        it "invalidates inclusion of #{invalid_role}" do
          expect(build(:role, role: invalid_role)).not_to be_valid
        end
      end
    end
  end
end
