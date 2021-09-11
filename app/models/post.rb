class Post < ApplicationRecord
  validates :caption, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
end
