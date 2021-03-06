class Post < ApplicationRecord
  validates :caption, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader
end
