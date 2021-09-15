class Relationship < ApplicationRecord
  belongs_to :follower_user, class_name: 'User', foreign_key: :follower_id, inverse_of: :followed_users
  belongs_to :followed_user, class_name: 'User', foreign_key: :followed_id, inverse_of: :follower_users
end
