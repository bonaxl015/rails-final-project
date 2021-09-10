class UserRole < ApplicationRecord
  validates :user, presence: true
  validates :role, presence: true
  belongs_to :user
  belongs_to :role
end
