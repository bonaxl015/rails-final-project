class Role < ApplicationRecord
  validates :role, inclusion: { in: %w[Admin Moderator Ordinary] }
  has_many :user_roles
  has_many :users, through: :user_roles
end
