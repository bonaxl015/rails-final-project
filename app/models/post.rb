class Post < ApplicationRecord
  validates :caption, presence: true
  belongs_to :user
  has_one_attached :image
end
