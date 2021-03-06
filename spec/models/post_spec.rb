require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { create(:post) }

  let(:post_with_comments) { create(:post_with_comments) }
  let(:post_with_likes) { create(:post_with_likes) }

  let(:image) do
    Rack::Test::UploadedFile.new(Rails.root.join('spec/support/rspec-image-test.jpeg'), 'image/jpg')
  end

  it 'belongs to user' do
    expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'has many comments' do
    expect(described_class.reflect_on_association(:comments).macro).to eq(:has_many)
  end

  it 'has one attached image' do
    expect(build(:post, image: image)).to be_valid
  end

  it 'has many likes' do
    expect(described_class.reflect_on_association(:likes).macro).to eq(:has_many)
  end

  it 'deletes its comments' do
    post_with_comments.destroy
    expect(Comment.find_by(post_id: post_with_comments.id)).to eq(nil)
  end

  it 'deletes its likes' do
    post_with_likes.destroy
    expect(Like.find_by(post_id: post_with_likes.id)).to eq(nil)
  end

  describe '#caption' do
    it 'invalidates null' do
      post.caption = nil
      post.valid?
      expect(post.errors[:caption].size).to eq(1)
    end
  end
end
