require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  let(:user_with_posts) { create(:user_with_posts) }
  let(:user_with_comments) { create(:user_with_comments) }
  let(:user_with_likes) { create(:user_with_likes) }
  let(:user_with_events) { create(:user_with_events) }
  let(:user_with_attends) { create(:user_with_attends) }

  it 'has many user roles' do
    expect(described_class.reflect_on_association(:user_roles).macro).to eq(:has_many)
  end

  it 'has many roles' do
    expect(described_class.reflect_on_association(:roles).macro).to eq(:has_many)
  end

  it 'has many posts' do
    expect(described_class.reflect_on_association(:posts).macro).to eq(:has_many)
  end

  it 'has many comments' do
    expect(described_class.reflect_on_association(:comments).macro).to eq(:has_many)
  end

  it 'has many likes' do
    expect(described_class.reflect_on_association(:likes).macro).to eq(:has_many)
  end

  it 'has many events' do
    expect(described_class.reflect_on_association(:events).macro).to eq(:has_many)
  end

  it 'has many attends' do
    expect(described_class.reflect_on_association(:attends).macro).to eq(:has_many)
  end

  it 'has many given follows' do
    expect(described_class.reflect_on_association(:given_follows).macro).to eq(:has_many)
  end

  it 'has many followed users' do
    expect(described_class.reflect_on_association(:followed_users).macro).to eq(:has_many)
  end

  it 'has many received follows' do
    expect(described_class.reflect_on_association(:received_follows).macro).to eq(:has_many)
  end

  it 'has many follower users' do
    expect(described_class.reflect_on_association(:follower_users).macro).to eq(:has_many)
  end

  it 'deletes its user roles' do
    user.destroy
    expect(UserRole.find_by(user_id: user.id)).to eq(nil)
  end

  it 'deletes its posts' do
    user_with_posts.destroy
    expect(Post.find_by(user_id: user_with_posts.id)).to eq(nil)
  end

  it 'deletes its comments' do
    user_with_comments.destroy
    expect(Comment.find_by(user_id: user_with_comments.id)).to eq(nil)
  end

  it 'deletes its likes' do
    user_with_likes.destroy
    expect(Like.find_by(user_id: user_with_likes.id)).to eq(nil)
  end

  it 'deletes its events' do
    user_with_events.destroy
    expect(Event.find_by(user_id: user_with_events.id)).to eq(nil)
  end

  it 'deletes its attends' do
    user_with_attends.destroy
    expect(Attend.find_by(user_id: user_with_attends.id)).to eq(nil)
  end

  it 'deletes its given follows' do
    create(:relationship, follower_id: user.id)
    user.destroy
    expect(Relationship.find_by(follower_id: user.id)).to eq(nil)
  end

  it 'deletes its received follows' do
    create(:relationship, followed_id: user.id)
    user.destroy
    expect(Relationship.find_by(followed_id: user.id)).to eq(nil)
  end

  it 'adds default role after commit' do
    user
    expect(Role.find_by(role: user.roles.first.role)).not_to eq(nil)
  end

  it 'validates with valid attributes' do
    expect(user).to be_valid
  end

  describe '#username' do
    it 'invalidates null' do
      user.username = nil
      user.valid?
      expect(user.errors[:username].size).to eq(3)
    end

    it 'invalidates less than 3 characters' do
      user.username = 'A' * 2
      user.valid?
      expect(user.errors[:username].size).to eq(1)
    end

    it 'invalidates special characters' do
      user.username = '.' * 6
      user.valid?
      expect(user.errors[:username].size).to eq(1)
    end

    context 'when unique but case sensitive' do
      before do
        user.username = create(:user).username.upcase
        user.valid?
      end

      it 'does not validate' do
        expect(user.errors[:username].size).to eq(1)
      end
    end

    context 'when unique but not case sensitive' do
      before do
        user.username = create(:user).username
        user.valid?
      end

      it 'does not validate' do
        expect(user.errors[:username].size).to eq(1)
      end
    end
  end

  describe '#first_name' do
    it 'invalidates null' do
      user.first_name = nil
      user.valid?
      expect(user.errors[:first_name].size).to eq(1)
    end
  end

  describe '#last_name' do
    it 'invalidates null' do
      user.last_name = nil
      user.valid?
      expect(user.errors[:last_name].size).to eq(1)
    end
  end
end
