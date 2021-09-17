class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend FriendlyId
  friendly_id :username, use: %i[slugged history finders]
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3 },
                       format: { with: /\A[A-Za-z0-9]+\z/ }
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :given_follows, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower_user
  has_many :followed_users, through: :given_follows, source: :followed_user
  has_many :received_follows, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed_user
  has_many :follower_users, through: :received_follows, source: :follower_user
  after_save :add_default_role

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_default_role
    User.find_by(id: id).roles << Role.create(role: 'Ordinary')
  end

  def should_generate_new_friendly_id?
    username_changed?
  end

  def follow(user)
    given_follows.create(followed_id: user.id)
  end

  def unfollow(user)
    given_follows.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followed_users.include?(user)
  end
end
